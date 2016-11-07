import csv
import json
import math
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

flags.DEFINE_string("data", "", "Path to the data.")
flags.DEFINE_string("model", "linear",
                    "Valid model types: {'linear', 'svm'}.")
flags.DEFINE_integer("batch_size", 100, "Size of each training minibatch.")
flags.DEFINE_integer("n_folds", 1, "Number of folds for cross-validation.")
flags.DEFINE_float("train_rate", 0.1, "Training rate.")

def main(_):
    train_and_eval()

def train_and_eval():
    df, fs, ls = input.load_csv(FLAGS.data, filter_no_labels=True)
    # shuffle the data
    df = df.sample(frac=1)
    train, test = build_model(fs, ls)

    if FLAGS.n_folds > 1:
        raise 'unimplemented'
    else:
        n = len(df) / 10
        (_, rest), (_, df_test) = df.groupby(df.index < n)
        (_, df_train), (_, df_validate) = rest.groupby(rest.index < 2*n)
        train_model(train, df_train, validation=df_validate)
        test_model(test, df_test)

def build_model(fs, ls):
    if FLAGS.model == 'linear':
        return linear.build_model(fs, ls, train_rate=FLAGS.train_rate)
    elif FLAGS.model == 'svm':
        return svm.build_model(fs, ls)
    else:
        raise ("unknown model type: " + FLAGS.model)

def train_model(train, df, validation=None):
    i = 0
    for _, batch in df.groupby(df.index // FLAGS.batch_size):
        train(batch, i, validation)
        i += 1

def test_model(test, df):
    test(df)

if __name__ == '__main__':
    tf.app.run()
