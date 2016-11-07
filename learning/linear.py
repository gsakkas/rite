import matplotlib.pyplot as plt
import numpy as np
import tensorflow as tf

import math

import util

def build_model(features, labels, train_rate=0.1, model_dir=None):
    '''Build a linear classifier.

    @param features: A list of feature names.
    @param labels: A list of label names.
    @param train_rate: The training rate, defaults to 0.1.
    @param model_dir: A directory to store the model summaries in.

    @return: A 4-tuple of training, testing, plotting, and closing functions.
    '''

    n_in = len(features)
    n_out = len(labels)

    x = tf.placeholder(tf.float32, [None, n_in], name='x')

    with tf.name_scope('linear'):
        W = tf.Variable(
            tf.truncated_normal([n_in, n_out],
                                stddev=1.0 / math.sqrt(float(n_in))),
            name='W')
        b = tf.Variable(tf.zeros([n_out]), name='b')
        util.variable_summaries(W,'W')
        util.variable_summaries(b,'b')
        y = tf.matmul(x, W) + b

    y_ = tf.placeholder(tf.float32, [None, n_out], name='y_')

    with tf.name_scope('cross_entropy'):
        cross_entropy = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits(y, y_), name='xentropy_mean')
        tf.scalar_summary('cross_entropy', cross_entropy)
    with tf.name_scope('train'):
        train_step = tf.train.GradientDescentOptimizer(train_rate).minimize(cross_entropy)

    sess = tf.InteractiveSession()
    merged = tf.merge_all_summaries()
    summary_writer = tf.train.SummaryWriter(model_dir, sess.graph)
    tf.initialize_all_variables().run()

    if n_out >= 2:
        correct_prediction = tf.equal(tf.argmax(y,1), tf.argmax(y_,1))
    else:
        correct_prediction = tf.equal(tf.sign(y), y_)
    accuracy = tf.reduce_mean(tf.cast(correct_prediction, tf.float32))


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

    return train, test, plot, close
