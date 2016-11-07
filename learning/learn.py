import csv
import json
import math
import os.path
import random
random.seed()

import numpy as np
import pandas as pd
import tensorflow as tf
import tensorflow.contrib.learn.python.learn as learn

# local modules
import input
import linear
import plot
import util

flags = tf.app.flags
FLAGS = flags.FLAGS

flags.DEFINE_bool("verbose", False, "Print verbose output.")
flags.DEFINE_string("data", "", "Path to the data.")
flags.DEFINE_string("model", "linear",
                    "Valid model types: {'linear', 'svm'}.")
flags.DEFINE_string("model_dir", "/tmp/tensorflow", '')
flags.DEFINE_integer("batch_size", 100, "Size of each training minibatch.")
flags.DEFINE_float("train_rate", 0.1, "Training rate.")
flags.DEFINE_integer("n_folds", 1, "Number of folds for cross-validation.")
flags.DEFINE_bool("plot", False, "Plot the learned model.")

def main(_):
    df, fs, ls = input.load_csv(FLAGS.data, filter_no_labels=True)
    # shuffle the data
    df = df.sample(frac=1).reset_index(drop=True)
    #print df.shape
    if FLAGS.n_folds > 1:
        for i, fold in df.groupby(df.index % FLAGS.n_folds):
            print('fold {}'.format(i))
            #print fold.shape
            train_and_eval(fold.reset_index(drop=True), fs, ls, i)
            print('')
    else:
        train_and_eval(df, fs, ls)


def train_and_eval(df, fs, ls, i=0):
    train, test, plot, close = build_model(
        fs, ls, os.path.join(FLAGS.model_dir, 'run{}'.format(i)))

    n = len(df) / 10
    # split off 1/10 of the data for a test group
    (_, rest), (_, df_test) = df.groupby(df.index < n)
    # and another 1/10 for a validation group
    (_, df_train), (_, df_validate) = rest.groupby(rest.index < 2*n)
    train_model(train, df_train, validation=df_validate)
    test_model(test, df_test)

    if FLAGS.plot:
        plot()

    close()
    tf.reset_default_graph()

def build_model(fs, ls, model_dir):
    if FLAGS.model == 'linear':
        return linear.build_model(fs, ls, train_rate=FLAGS.train_rate,
                                  model_dir=model_dir)
    elif FLAGS.model == 'svm':
        return svm.build_model(fs, ls, train_rate=FLAGS.train_rate,
                               model_dir=model_dir)
    else:
        raise ("unknown model type: " + FLAGS.model)

def train_model(train, df, validation=None):
    i = 0
    for _, batch in df.groupby(df.index // FLAGS.batch_size):
        train(batch, i, validation, verbose=FLAGS.verbose)
        i += 1

def test_model(test, df):
    test(df)

if __name__ == '__main__':
    tf.app.run()
