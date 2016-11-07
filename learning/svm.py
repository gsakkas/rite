import matplotlib.pyplot as plt
import numpy as np
import tensorflow as tf

import math

import util

def build_model(features, labels, learn_rate=0.1, model_dir=None):
    '''Build a linear classifier.

    @param features: A list of feature names.
    @param labels: A list of label names.
    @param learn_rate: The training rate, defaults to 0.1.
    @param model_dir: A directory to store the model summaries in.

    @return: A 4-tuple of training, testing, plotting, and closing functions.
    '''

    ## TODO: construct actual model

    def train(data, i, validation=None, verbose=False):
        summary_str, _ = sess.run([merged, train_step],
                                  feed_dict={x: data[features], y_: data[labels]})
        summary_writer.add_summary(summary_str, i)
        if validation is not None:
            acc = sess.run(accuracy,
                           feed_dict={x: validation[features], y_: validation[labels]})
            if verbose and i % 100 == 0:
                print('accuracy at step {}: {}'.format(i, acc))


    def test(data):
        acc = sess.run(accuracy, {x: data[features], y_: data[labels]})
        print('accuracy: %f' % acc)

    def plot():
        w = sess.run(tf.transpose(W))
        plt.matshow(w, cmap='hot', interpolation='nearest')
        plt.xticks(np.arange(len(features)), features, rotation=90)
        plt.yticks(np.arange(len(labels)), labels)
        # plt.legend()
        plt.show()

    def close():
        sess.close()
        tf.reset_default_graph()

    return train, test, plot, close
