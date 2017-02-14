import math
import os.path
import random
random.seed()

import numpy as np
import pandas as pd
from sklearn.model_selection import KFold
import tensorflow as tf
import tensorflow.contrib.learn.python.learn as learn

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
flags.DEFINE_string("model_dir", "/tmp/tensorflow", '')
flags.DEFINE_string("hidden_layers", "", "")
flags.DEFINE_integer("batch_size", 100, "Size of each training minibatch.")
flags.DEFINE_integer("n_batches", None, "Number of training rounds.")
flags.DEFINE_float("learn_rate", 0.1, "Learning rate.")
flags.DEFINE_integer("n_folds", 1, "Number of folds for cross-validation.")
flags.DEFINE_bool("plot", False, "Plot the learned model.")
flags.DEFINE_bool("only_slice", False, "Only look at exprs in the error slice.")

def load_data(path):
    csvs = [f for f in os.listdir(path) if f.endswith('.csv')]
    random.shuffle(csvs)
    dfs = []
    for i, csv in enumerate(csvs):
        df, fs, ls = input.load_csv(os.path.join(path, csv),
                                    only_slice=FLAGS.only_slice)
        if df is None:
            print i
            continue
        if df.shape[0] == 0:
            print i
            continue
        dfs.append(df)
    return (dfs, fs, ls)

def main(_):
    dfs, fs, ls = load_data(FLAGS.data)
    # train_and_eval(dfs, fs, ls)

    # # shuffle the data
    # df = df.sample(frac=1).reset_index(drop=True)
    # #print df.shape
    if FLAGS.n_folds > 1:
        kf = KFold(n_splits=FLAGS.n_folds)
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
        # FIXME: wrong cross-validation, want to slice data into
        # n_folds segments and train on n_folds-1
        # for i, fold in df.groupby(df.index % FLAGS.n_folds):
        #     print('fold {}'.format(i))
        #     #print fold.shape
        #     train_and_eval(fold.reset_index(drop=True), fs, ls, i)
        #     print('')
    else:
        if FLAGS.test_data == '':
            train_and_eval(dfs, fs, ls)
        else:
            tdfs, _, _ = load_data(FLAGS.test_data)
            train_and_eval(dfs, fs, ls, test_data=tdfs)



def train_and_eval(dfs, fs, ls, i=0, train_idxs=None, test_idxs=None, test_data=None):
    train, test, plot, close = build_model(
        fs, ls, os.path.join(FLAGS.model_dir, 'run{}'.format(i)))

    if test_data is not None:
        train_model(train, dfs, ls)
        test_model(test, test_data)


    elif train_idxs is not None and test_idxs is not None:
        train_model(train, [dfs[idx] for idx in train_idxs], ls)
        r = test_model(test, [dfs[idx] for idx in test_idxs])
        close()
        return r

    else:
        n = len(dfs) / 10
        df_test = dfs[-n:]
        df_validate = dfs[-2*n:-n]
        df_train = dfs[:-2*n]
        # # split off 1/10 of the data for a test group
        # (_, rest), (_, df_test) = df.groupby(df.index < n)
        # # and another 1/10 for a validation group
        # (_, df_train), (_, df_validate) = rest.groupby(rest.index < 2*n)
        train_model(train, df_train, ls, validation=df_validate)
        test_model(test, df_test)

        if FLAGS.plot:
            plot()

        close()

def build_model(fs, ls, model_dir):
    if FLAGS.model == 'linear':
        return linear.build_model(fs, ls, learn_rate=FLAGS.learn_rate,
                                  model_dir=model_dir)
    elif FLAGS.model == 'svm':
        return svm.build_model(fs, ls, learn_rate=FLAGS.learn_rate,
                               model_dir=model_dir)
    elif FLAGS.model == 'hidden':
        hidden_layers = FLAGS.hidden_layers.split('-')
        return hidden.build_model(fs, ls, hidden_layers, learn_rate=FLAGS.learn_rate,
                               model_dir=model_dir)
    else:
        raise ("unknown model type: " + FLAGS.model)

def train_model(train, dfs, label_names, validation=None):
    i = 0
    # for df in dfs:
    #     # balance labels for training
    #     # print df.shape
    #     classes = list(df.groupby(label_names))
    #     if any(len(c) == 0 for _, c in classes):
    #         continue
    #     max_samples = max(len(c) for _, c in classes)
    #     # print max_samples
    #     df = pd.concat(c.sample(max_samples, replace=True) for _, c in classes)
    #     # print df.shape

    #     train(df, i, validation, verbose=FLAGS.verbose)
    #     i += 1
    # print len(dfs)
    df = pd.concat(dfs)
    print df.shape
    feature_names = [c for c in df.columns if c[0] == 'F']
    print df.drop_duplicates().shape
    print df.drop_duplicates(feature_names).shape
    classes = list(df.groupby(label_names))
    max_samples = max(len(c) for _, c in classes)
    df = pd.concat(c.sample(max_samples, replace=True) for _, c in classes)
    if FLAGS.n_batches is not None:
        df = df.sample(FLAGS.n_batches * FLAGS.batch_size, replace=True).reset_index(drop=True)
    else:
        df = df.sample(frac=1).reset_index(drop=True)
    print df.shape
    for _, batch in df.groupby(df.index // FLAGS.batch_size):
        train(batch, i, validation, verbose=FLAGS.verbose)
        i += 1

def test_model(test, dfs):
    return test(dfs)

if __name__ == '__main__':
    tf.app.run()
