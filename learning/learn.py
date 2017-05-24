from __future__ import print_function

import math
import os.path
import random
import sys
import time

from hyperopt import fmin, tpe, hp
import numpy as np
import pandas as pd
from sklearn.model_selection import KFold, ShuffleSplit
import tensorflow as tf

# local modules
import hidden
import input
import linear
import svm
import util

flags = tf.app.flags
FLAGS = flags.FLAGS

flags.DEFINE_bool("verbose", False, "Print verbose output.")
flags.DEFINE_string("data", "", "Path to the data.")
flags.DEFINE_string("test_data", "", "Path to test data (if separate from training).")
flags.DEFINE_string("model", "linear",
                    "Valid model types: {'linear', 'svm', 'hidden'}.")
flags.DEFINE_string("model_dir", None, '')
flags.DEFINE_string("hidden_layers", "", "")
flags.DEFINE_integer("batch_size", 100, "Size of each training minibatch.")
flags.DEFINE_integer("n_batches", None, "Number of training rounds.")
flags.DEFINE_integer("n_epochs", 1, "Number of training rounds.")
flags.DEFINE_float("learn_rate", 0.1, "Learning rate.")
flags.DEFINE_float("reg_rate", 0.01, "Regularization rate.")
flags.DEFINE_float("reg_out_rate", None, "Regularization rate for output (defaults to reg_rate).")
flags.DEFINE_integer("n_folds", 1, "Number of folds for cross-validation.")
flags.DEFINE_bool("plot", False, "Plot the learned model.")
flags.DEFINE_bool("only_slice", False, "Only look at exprs in the error slice.")
flags.DEFINE_bool("no_slice", False, "Ignore the error slice feature.")
flags.DEFINE_bool("store_predictions", False,
                  "Whether to store predictions for offline analysis.")
flags.DEFINE_bool("hyperopt", False, "Whether to use hyperopt to tune parameters.")
flags.DEFINE_integer("seed", None, '')


def load_data(path):
    csvs = [f for f in os.listdir(path) if f.endswith('.csv')]
    random.shuffle(csvs)
    dfs = []
    for i, csv in enumerate(csvs):
        f = os.path.join(path, csv)
        df, fs, ls = input.load_csv(f, only_slice=FLAGS.only_slice, no_slice=FLAGS.no_slice)
        if df is None:
            print(i)
            continue
        if df.shape[0] == 0:
            print(i)
            continue
        dfs.append((f, df))
    return (dfs, fs, ls)

def cross_validate(dfs, fs, ls):
    kf = KFold(n_splits=FLAGS.n_folds, random_state=FLAGS.seed)
    #kf = ShuffleSplit(n_splits=1, test_size=0.25, random_state=FLAGS.seed)
    # print(len(dfs))
    rs = []
    for i, (train, test) in enumerate(kf.split(dfs)):
        print('.', end='')
        sys.stdout.flush()
        # print(len(train), len(test))
        rs.append(train_and_eval(dfs, fs, ls, i=i, train_idxs=train, test_idxs=test))
    return {'top-1': np.mean([r['top-1'] for r in rs]),
            'top-2': np.mean([r['top-2'] for r in rs]),
            'top-3': np.mean([r['top-3'] for r in rs])}

def objective(dfs, fs, ls, a, b, m):
    #print('learn_rate', 10**a, 'reg_rate', 10**b, 'reg_out', 10**bo, 'mini_batch', m)
    #print('learn_rate', 10**a, 'reg_rate', 10**b, 'reg_out', 10**bo)
    print('learn_rate', 10**a, 'reg_rate', 10**b, 'mini_batch', m)
    #print('learn_rate', 10**a, 'reg_rate', 10**b)
    FLAGS.learn_rate = 10 ** a
    FLAGS.reg_rate = 10 ** b
    FLAGS.reg_out_rate = 10 ** b
    FLAGS.batch_size = int(m)
    loss = 1 - cross_validate(dfs, fs, ls)['top-1']
    print(loss)
    return loss

def hyperopt(dfs, fs, ls):
    space = (hp.uniform('alpha', -4, 0),
             hp.uniform('beta',  -3, 0),
             #hp.uniform('beta_out',  -3, 0)),
             hp.quniform('minibatch', 10, 500, 10),
             )
    best = fmin(fn=lambda (a, b, m): objective(dfs, fs, ls, a, b, m),
                space=space,
                algo=tpe.suggest,
                max_evals=200)
    print(best)

def main(_):
    if FLAGS.reg_out_rate is None:
        FLAGS.reg_out_rate = FLAGS.reg_rate

    if FLAGS.seed is not None:
        random.seed(FLAGS.seed)
    else:
        random.seed()
        FLAGS.seed = random.randint(0, 1000000)
        random.seed(FLAGS.seed)
        print('using seed:', FLAGS.seed)
    dirs = FLAGS.data.split(':')
    dfs = []
    for dir in dirs:
        df, fs, ls = load_data(dir)
        dfs += df

    if FLAGS.hyperopt:
        return hyperopt(dfs, fs, ls)

    # # shuffle the data
    # df = df.sample(frac=1).reset_index(drop=True)
    # #print df.shape
    if FLAGS.n_folds > 1:
        kf = KFold(n_splits=FLAGS.n_folds, random_state=FLAGS.seed)
        # print(len(dfs))
        rs = []
        for i, (train, test) in enumerate(kf.split(dfs)):
            print('fold {}'.format(i))
            # print(len(train), len(test))
            rs.append(train_and_eval(dfs, fs, ls, i=i, train_idxs=train, test_idxs=test))
            print('')
        print('cross-fold average')
        print('accuracy: %.3f / %.3f / %.3f' % (np.mean([r['top-1'] for r in rs]),
                                                np.mean([r['top-2'] for r in rs]),
                                                np.mean([r['top-3'] for r in rs])))
        print('recall: %.3f' % (np.mean([r['recall'] for r in rs])))
        _, features = os.path.split(FLAGS.data)
        if features == 'op+slice' and FLAGS.no_slice:
            features += '-no-slice'
        elif features == 'op+slice' and FLAGS.only_slice:
            features += '-only-slice'
        model = FLAGS.model
        if model == 'hidden':
            model += '-' + FLAGS.hidden_layers
        with open('models/'+model+'-'+features+'.cross.csv', 'w') as f:
            f.write('model,features,top-1,top-2,top-3,recall\n')
            f.write('%s,%s,%.3f,%.3f,%.3f,%.3f\n' % (
                model, features,
                np.mean([r['top-1'] for r in rs]),
                np.mean([r['top-2'] for r in rs]),
                np.mean([r['top-3'] for r in rs]),
                np.mean([r['recall'] for r in rs])))


    else:
        if FLAGS.test_data == '':
            train_and_eval(dfs, fs, ls)
        else:
            # we have a separate test dataset
            tdfs, _, _ = load_data(FLAGS.test_data)
            train_and_eval(dfs, fs, ls, test_data=tdfs)



def train_and_eval(dfs, fs, ls, i=0, train_idxs=None, test_idxs=None, test_data=None):
    tf.set_random_seed(FLAGS.seed)
    model_dir = os.path.join(FLAGS.model_dir, 'run{}'.format(i)) if FLAGS.model_dir is not None else None
    train, test, plot, close = build_model(fs, ls, model_dir)

    if test_data is not None:
        train_model(train, dfs, ls)
        test_model(test, test_data)
        if FLAGS.plot:
            plot()
        close()

    elif train_idxs is not None and test_idxs is not None:
        train_model(train, [dfs[idx] for idx in train_idxs], ls)
        r = test_model(test, [dfs[idx] for idx in test_idxs])
        close()
        return r

    else:
        train_model(train, dfs, ls)
        if FLAGS.plot:
            plot()
        close()

def build_model(fs, ls, model_dir):
    if FLAGS.model == 'linear':
        return linear.build_model(fs, ls,
                                  learn_rate=FLAGS.learn_rate,
                                  beta=FLAGS.reg_rate,
                                  model_dir=model_dir)
    elif FLAGS.model == 'svm':
        return svm.build_model(fs, ls, learn_rate=FLAGS.learn_rate,
                               model_dir=model_dir)
    elif FLAGS.model == 'hidden':
        hidden_layers = FLAGS.hidden_layers.split('-')
        return hidden.build_model(fs, ls, hidden_layers,
                                  learn_rate=FLAGS.learn_rate,
                                  beta=FLAGS.reg_rate,
                                  beta_out=FLAGS.reg_out_rate,
                                  model_dir=model_dir)
    else:
        raise ("unknown model type: " + FLAGS.model)

def train_model(train, dfs, label_names, validation=None):
    # print len(dfs)
    df = pd.concat([df for _, df in dfs])
    #print(df.shape)
    #feature_names = [c for c in df.columns if c[0] == 'F']
    #print df.drop_duplicates().shape
    #print df.drop_duplicates(feature_names).shape
    classes = list(df.groupby(label_names, sort=False))
    max_samples = max(len(c) for _, c in classes)
    df = pd.concat(c.sample(max_samples, replace=True, random_state=FLAGS.seed) for _, c in classes)
    #print(df.shape)
    if FLAGS.n_batches is not None:
        df = df.sample(FLAGS.n_batches * FLAGS.batch_size, replace=True, random_state=FLAGS.seed) # .reset_index(drop=True)
        FLAGS.n_epochs = 1
    # else:
    #     df = df.sample(frac=FLAGS.n_epochs, replace=FLAGS.n_epochs>1, random_state=FLAGS.seed).reset_index(drop=True)
    # print(df.shape)
    start = time.time()
    for i in xrange(FLAGS.n_epochs):
        # print('epoch {}'.format(i))
        df = df.sample(frac=1) # .reset_index(drop=True)
        # print(df.shape)
        train(df, i, validation, verbose=FLAGS.verbose, batch_size=FLAGS.batch_size)
    print('training complete in %.2f seconds' % (time.time() - start))

def test_model(test, dfs):
    start = time.time()
    r = test(dfs, store_predictions=FLAGS.store_predictions,
             loud=not FLAGS.hyperopt)
    print('testing complete in %.2f seconds' % (time.time() - start))
    return r

if __name__ == '__main__':
    tf.app.run()
