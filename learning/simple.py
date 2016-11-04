import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import tensorflow as tf
import tensorflow.contrib.learn.python.learn as learn

import csv
import json
import math
import random
random.seed()

def read_data(path):
    df = pd.read_csv('data/type-inference+vars.csv')
    label_names = [c for c in df.columns if c[0] == 'L']
    feature_names = [c for c in df.columns if c[0] == 'F']

    print df.shape
    # filter out vectors with no predictions
    criteria = (df[l] == 1.0 for l in label_names)
    df = df[reduce(lambda x, acc: x | acc, criteria)]
    print df.shape

    return (df, feature_names, label_names)

def plot_weights(w, x_labels, y_labels):
    plt.matshow(w, cmap='hot', interpolation='nearest')
    plt.xticks(np.arange(len(x_labels)), x_labels, rotation=90)
    plt.yticks(np.arange(len(y_labels)), y_labels)
    # plt.legend()
    plt.show()


df, feature_names, label_names = read_data('data/type-inference+vars.csv')

N_CATS = len(feature_names)
N_OUTS = len(label_names)

N_FOLDS = 1

# select an equal number of good and bad samples
# N_SAMPLES = 100000
# good=0
# bad=0
# samples = []
# for l in orig:
#     try:
#         d = json.loads(l)
#         # if d['kind'] == 'Good':
#         #     good+=1
#         #     if good > N_SAMPLES:
#         #         continue
#         # else:
#         #     bad+=1
#         #     if bad > N_SAMPLES:
#         #         continue
#         fs = [float(f) for f in d['features']]
#         ls = [float(l) for l in d['kind']]
#         if ls == [0. for l in d['kind']]:
#             #print 'skipping expr with unknown type'
#             continue
#         # if N_OUTS == 1:
#         #     l = [1.] if d['kind'] == 'Bad' else [-1.]
#         # else:
#         #     l = [1., 0.] if d['kind'] == 'Bad' else [0., 1.]
#     except:
#         continue
#     samples.append((fs, ls))
# # shuffle the samples again
# random.shuffle(samples)
# # and extract the data/labels
# data=[]
# labels=[]
# for d, l in samples:
#     data.append(d)
#     labels.append(l)
# data = np.array(data)
# labels = np.array(labels)
# print (data.shape, labels.shape)


def variable_summaries(var, name):
  """Attach a lot of summaries to a Tensor."""
  with tf.name_scope('summaries'):
    mean = tf.reduce_mean(var)
    tf.scalar_summary('mean/' + name, mean)
    with tf.name_scope('stddev'):
      stddev = tf.sqrt(tf.reduce_mean(tf.square(var - mean)))
    tf.scalar_summary('stddev/' + name, stddev)
    tf.scalar_summary('max/' + name, tf.reduce_max(var))
    tf.scalar_summary('min/' + name, tf.reduce_min(var))
    tf.histogram_summary(name, var)

N_HIDDEN = 30
N_HIDDEN_2 = 100


x = tf.placeholder(tf.float32, [None, N_CATS], name='x')

#with tf.name_scope('hidden_1'):
#    h_W = tf.Variable(tf.truncated_normal([N_CATS, N_HIDDEN], stddev=1.0 / math.sqrt(float(N_CATS))),
#                    name='W')
#    ## initializing hidden weights to 0 seems to make everything except
#    ## final biases go to 0, why??
#    # h_W = tf.Variable(tf.zeros([N_CATS, N_HIDDEN]),
#    #                 name='W')
#    h_b = tf.Variable(tf.zeros([N_HIDDEN]), name='b')
#    variable_summaries(h_W,'h_W')
#    variable_summaries(h_b,'h_b')
#
#    h = tf.nn.relu(tf.matmul(x, h_W) + h_b)
#
#with tf.name_scope('hidden_2'):
#    h2_W = tf.Variable(tf.truncated_normal([N_HIDDEN, N_HIDDEN_2], stddev=1.0 / math.sqrt(float(N_HIDDEN))),
#                    name='W')
#    ## initializing hidden weights to 0 seems to make everything except
#    ## final biases go to 0, why??
#    # h_W = tf.Variable(tf.zeros([N_CATS, N_HIDDEN]),
#    #                 name='W')
#    h2_b = tf.Variable(tf.zeros([N_HIDDEN_2]), name='b')
#    variable_summaries(h2_W,'h2_W')
#    variable_summaries(h2_b,'h2_b')
#
#    h2 = tf.nn.relu(tf.matmul(h, h2_W) + h2_b)

with tf.name_scope('linear'):
    #W = tf.Variable(tf.truncated_normal([N_HIDDEN_2, N_OUTS], stddev=1.0 / math.sqrt(float(N_CATS))),
    #                name='W')
    W = tf.Variable(tf.truncated_normal([N_CATS, N_OUTS], stddev=1.0 / math.sqrt(float(N_CATS))),
                    name='W')
    # W = tf.Variable(tf.zeros([N_HIDDEN, N_OUTS]),
    #                 name='W')
    b = tf.Variable(tf.zeros([N_OUTS]), name='b')
    variable_summaries(W,'W')
    variable_summaries(b,'b')

    #y = tf.matmul(h2, W) + b
    y = tf.matmul(x, W) + b

y_ = tf.placeholder(tf.float32, [None, N_OUTS], name='y_')

with tf.name_scope('cross_entropy'):
    cross_entropy = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits(y, y_), name='xentropy_mean')
    tf.scalar_summary('cross_entropy', cross_entropy)
with tf.name_scope('train'):
    train_step = tf.train.GradientDescentOptimizer(5).minimize(cross_entropy)
    #train_step = tf.train.AdamOptimizer(0.001).minimize(cross_entropy)

# def chunks(l, n):
#     """Yield successive n-sized chunks from l."""
#     for i in range(0, len(l), n):
#         yield l[i:i + n]

# from itertools import cycle

# fold_size = len(data) / N_FOLDS
# folds = cycle(chunks(data, fold_size))
# fold_labels = cycle(chunks(labels, fold_size))

for k in range(N_FOLDS):
    print('fold %d' % k)

    # data_test = folds.next()
    # labels_test = fold_labels.next()
    # # print data_test.shape
    # n_good=0
    # n_bad=0
    # for l in labels_test:
    #     if l[0] == 1.: # and l[1] == 0.:
    #         n_bad+=1
    #     else:
    #         n_good+=1
    # print n_good, n_bad


    # data_train = np.array([v for v in folds.next() for i in range(N_FOLDS-1)])
    # labels_train = np.array([v for v in fold_labels.next() for i in range(N_FOLDS-1)])

    df_test = df.sample(frac=0.1)
    features_test = df_test[feature_names]
    labels_test = df_test[label_names]

    df_train = df.sample(frac=0.9)
    features_train = df_train[feature_names]
    labels_train = df_train[label_names]

    sess = tf.InteractiveSession()
    merged = tf.merge_all_summaries()
    summary_writer = tf.train.SummaryWriter('/tmp', sess.graph)
    tf.initialize_all_variables().run()

    if N_OUTS >= 2:
        correct_prediction = tf.equal(tf.argmax(y,1), tf.argmax(y_,1))
    else:
        correct_prediction = tf.equal(tf.sign(y), y_)
    accuracy = tf.reduce_mean(tf.cast(correct_prediction, tf.float32))

    for i in range(1000):
        batch_xs = features_train[i*100 : i*100 + 100]
        batch_ys = labels_train[i*100 : i*100 + 100]
        summary_str, _, acc = sess.run([merged, train_step, accuracy], feed_dict={x: batch_xs, y_: batch_ys})
        summary_writer.add_summary(summary_str, i)
        #if i % 10 == 0:
        #    print('Accuracy at step %s: %s' % (i, acc))

    #print(data.shape)
    print('accuracy %f' % sess.run(accuracy, feed_dict={x: features_test, y_: labels_test}))
    # print(sess.run(y, feed_dict={x: [data[10001]], y_: [labels[10001]]}))
    # print('h_W')
    # for c, w in zip(CATEGORICAL_COLS, sess.run(h_W)):
    #     print c, w
    # print('h_b', sess.run(h_b))
    # print('W')
    # for c, w in zip(CATEGORICAL_COLS, sess.run(W)):
    #     print c, w
    # print(LABELS)
    # print(sess.run(tf.transpose(W)))
    # print(sess.run(b))

    w_learned = sess.run(tf.transpose(W))
    plot_weights(w_learned, feature_names, label_names)

    print("")

    # drop next set of data/labels to move to next fold
    # folds.next()
    # fold_labels.next()
