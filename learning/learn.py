import math
import os.path
import random
random.seed()

import numpy as np
import pandas as pd
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

def main(_):
    csvs = [f for f in os.listdir(FLAGS.data) if f.endswith('.csv')]
    random.shuffle(csvs)
    dfs = []
    for csv in csvs:
        df, fs, ls = input.load_csv(os.path.join(FLAGS.data, csv),
                                    filter_no_labels=True,
                                    only_slice=FLAGS.only_slice)
        if df is None:
            continue
        if df.shape[0] == 0:
            continue
        dfs.append(df)
    train_and_eval(dfs, fs, ls)

    # # shuffle the data
    # df = df.sample(frac=1).reset_index(drop=True)
    # #print df.shape
    # if FLAGS.n_folds > 1:
    #     # FIXME: wrong cross-validation, want to slice data into
    #     # n_folds segments and train on n_folds-1
    #     for i, fold in df.groupby(df.index % FLAGS.n_folds):
    #         print('fold {}'.format(i))
    #         #print fold.shape
    #         train_and_eval(fold.reset_index(drop=True), fs, ls, i)
    #         print('')
    # else:
    #     train_and_eval(df, fs, ls)


def train_and_eval(dfs, fs, ls, i=0):
    train, test, plot, close = build_model(
        fs, ls, os.path.join(FLAGS.model_dir, 'run{}'.format(i)))

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
    print len(dfs)
    df = pd.concat(dfs)
    print df.shape
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
    test(dfs)

if __name__ == '__main__':
    tf.app.run()
