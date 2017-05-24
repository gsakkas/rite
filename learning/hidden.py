import matplotlib.pyplot as plt
import numpy as np
import os.path
import pandas as pd
import tensorflow as tf

import json
import math
from time import time

import util

def build_model(features, labels, hidden,
                learn_rate=0.1, beta=0.01, beta_out=0.01, model_dir=None):
    '''Build a linear classifier with fully-connected hidden layers.

    @param features: A list of feature names.
    @param labels: A list of label names.
    @param hidden: A list of ints indicating how many neurons to put in each hidden layer.
    @param learn_rate: The training rate, defaults to 0.1.
    @param beta: The regularization rate, defaults to 0.01.
    @param beta_out: The regularization rate for the output layer, defaults to 0.01.
    @param model_dir: A directory to store the model summaries in.

    @return: A 4-tuple of training, testing, plotting, and closing functions.
    '''

    #print 'building MLP with alpha=%f, beta=%f' % (learn_rate, beta)

    n_in = len(features)
    n_out = len(labels)

    x = tf.placeholder(tf.float64, [None, n_in], name='x')
    keep_prob = tf.placeholder(tf.float64, name='keep_prob')

    global_step = tf.Variable(0, name='global_step', trainable=False)

    h = x
    n = n_in
    Ws = []
    bs = []
    for i, n_hidden in enumerate(hidden):
        n_hidden = int(n_hidden)
        with tf.name_scope('hidden-' + str(i)):
            W = tf.Variable(
                tf.truncated_normal([n, n_hidden],
                                    # we're using a ReLU, so initialize weights with
                                    # a variance of 2/n (according to He et al 2015)
                                    stddev=math.sqrt(2.0/float(n)),
                                    dtype=tf.float64),
                name='W_' + str(i))
            b = tf.Variable(tf.constant(0.0, shape=[n_hidden], dtype=tf.float64),
                            name='b_' + str(i))
            util.variable_summaries(W,'W_' + str(i))
            util.variable_summaries(b,'b_' + str(i))
            Ws.append(W)
            bs.append(b)
            # h = tf.nn.dropout(tf.nn.relu(tf.matmul(h, W) + b), keep_prob)
            h = tf.nn.relu(tf.matmul(h, W) + b)
        n = n_hidden

    with tf.name_scope('output'):
        W = tf.Variable(
            tf.truncated_normal([n, n_out],
                                stddev=math.sqrt(1.0/float(n)),
                                dtype=tf.float64),
            name='W')
        b = tf.Variable(tf.zeros([n_out], dtype=tf.float64),
                        name='b')
        util.variable_summaries(W,'W')
        util.variable_summaries(b,'b')
        y = tf.matmul(h, W) + b

    y_ = tf.placeholder(tf.float64, [None, n_out], name='y_')

    saver = tf.train.Saver(Ws + bs)

    with tf.name_scope('cross_entropy'):
        cross_loss = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits(logits=y, labels=y_))
        tf.summary.scalar('cross_loss', cross_loss)
        regularizers = beta * sum(tf.nn.l2_loss(w) for w in Ws) + beta_out * tf.nn.l2_loss(W)
        tf.summary.scalar('l2_loss', regularizers)
        loss = cross_loss + regularizers
        tf.summary.scalar('loss', loss)
    with tf.name_scope('train'):
        train_step = tf.train.AdamOptimizer(learn_rate).minimize(loss, global_step=global_step)

    if n_out >= 2:
        correct_prediction = tf.equal(tf.argmax(tf.nn.softmax(y),1), tf.argmax(y_,1))
    else:
        correct_prediction = tf.equal(tf.sign(y), y_)
    accuracy = tf.reduce_mean(tf.cast(correct_prediction, tf.float64))
    tf.summary.scalar('accuracy', accuracy)


    k = tf.placeholder(tf.int32, [], name='k')
    top_k = tf.nn.top_k(tf.transpose(tf.nn.softmax(y)), k)
    sess = tf.InteractiveSession()
    merged = tf.summary.merge_all()
    if model_dir:
        summary_writer = tf.summary.FileWriter(model_dir, sess.graph)

    ## NOTE: must be last!!
    tf.global_variables_initializer().run()

    # saver.restore(sess, 'hidden_model')

    def train(data, i, validation=None, verbose=False, batch_size=200):
        for _, batch in data.groupby(np.arange(len(data)) // batch_size, sort=False):
            # print(batch.shape)
            summary, _, step = sess.run(
                [merged, train_step, global_step],
                feed_dict={x: batch[features], y_: batch[labels],
                           # keep_prob: 0.5})
                           keep_prob: 1.0}  # TODO: should we use dropout??
            )
            if model_dir:
                summary_writer.add_summary(summary, step)
        ws1, bs1, w1, b1 = sess.run([Ws, bs, W, b])
        with open('models/hidden-' + '-'.join(hidden) + '.json', 'w') as f:
            d = {'hidden': [{'weights': ws2.tolist(), 'biases': bs2.tolist()}
                            for ws2, bs2 in zip(ws1, bs1)],
                 'output': {'weights': w1.tolist(),  'biases': b1.tolist()}}
            json.dump(d, f, indent=2)



    def test(data, store_predictions=False, loud=True):
        acc1 = 0
        acc2 = 0
        acc3 = 0
        ps = []
        rs = []
        fs = []
        cs = []
        ts = []
        times = []

        for f, d in data:
            start = time()
            (top_values, top_indices), truth, observed = sess.run(
                [top_k, tf.argmax(y_,1), tf.argmax(y,1)],
                feed_dict={x: d[features], y_:d[labels],
                           k:min(3, len(d)), keep_prob:1.0})
            times.append(time() - start)
            if store_predictions:
                dir, f = os.path.split(f)
                f, _ = os.path.splitext(f)
                f = os.path.join(dir, 'hidden-' + '-'.join(hidden), f + '.ml.out')
                if not os.path.exists(os.path.dirname(f)):
                    os.makedirs(os.path.dirname(f))
                with open(f, 'w') as f:
                    for idx in top_indices[1]:
                        span = d.iloc[idx]['SourceSpan']
                        f.write(span)
                        f.write('\n')

            inc1 = 0
            inc2 = 0
            inc3 = 0
            correct = 0
            n_top = len(top_indices[1])
            if d['L-DidChange'][top_indices[1][0]] == 1:
                inc1 = 1
                inc2 = 1
                inc3 = 1
                correct += 1
            if n_top > 1 and d['L-DidChange'][top_indices[1][1]] == 1:
                inc2 = 1
                inc3 = 1
                correct += 1
            if n_top > 2 and d['L-DidChange'][top_indices[1][2]] == 1:
                inc3 = 1
                correct += 1
            acc1 += inc1
            acc2 += inc2
            acc3 += inc3

            # True positives.
            #tp = np.sum(np.logical_and(truth, observed))
            # False positives.
            #fp = np.sum(np.logical_and(np.logical_not(truth), observed))
            # False negatives.
            #fn = np.sum(np.logical_and(truth, np.logical_not(observed)))
            # True negatives.
            #tn = np.sum(np.logical_and(np.logical_not(truth), np.logical_not(observed)))
            # precision = np.float64(tp) / np.float64(tp + fp)
            # modified recall where top-3 predictions are the only "true" predictions
            c = len(d[(d['L-DidChange'] == 1) & (d['F-InSlice'] == 1)])
            recall = np.float64(correct) / np.float64(c)
            # fscore = np.float64(2.0) * precision * recall / (precision + recall)
            # if not np.isnan(precision):
            #     ps.append(precision)
            if not np.isnan(recall):
                rs.append(recall)
            cs.append(c)
            ts.append(len(d))
            # if not np.isnan(fscore):
            #     fs.append(fscore)
            #cs.append(tp+fn)
            #ts.append(tp+fp+fn+tn)
            #print('true changes: %d' % (tp+fn))
            #print('p/r/f1: %.3f / %.3f / %.3f' % (precision, recall, fscore))
            #print('')

        acc1 = float(acc1) / len(data)
        acc2 = float(acc2) / len(data)
        acc3 = float(acc3) / len(data)
        if loud:
            print('final accuracy: %.3f / %.3f / %.3f' % (acc1, acc2, acc3))
            print('avg/std recall: %.3f / %.3f' % (np.mean(rs), np.std(rs)))
            # print('avg p/r/f1: %.3f / %.3f / %.3f' % (np.mean(ps), np.mean(rs), np.mean(fs)))
            # print('std p/r/f1: %.3f / %.3f / %.3f' % (np.std(ps), np.std(rs), np.std(fs)))
            print('avg / std / med samples: %.2f / %.2f / %.2f' % (np.mean(ts), np.std(ts), np.median(ts)) )
            print('avg / std / med changes: %.2f / %.2f / %.2f' % (np.mean(cs), np.std(cs), np.median(cs)) )
            print('avg prediction time: %f' % np.mean(times))

        saver.save(sess, 'hidden-' + '-'.join(hidden))

        return {'top-1': acc1, 'top-2': acc2, 'top-3': acc3, 'recall': np.mean(rs)}

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
