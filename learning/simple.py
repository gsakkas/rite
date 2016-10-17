import numpy as np
import tensorflow as tf
import tensorflow.contrib.learn.python.learn as learn

import json
import random
random.seed()

CATEGORICAL_COLS = ["Eq","Neq","Lt","Le","Gt","Ge",
                    "And","Or",
                    "Plus","Minus","Times","Div","Mod",
                    "::", "[]", "(,)", "Fun"]

N_CATS = len(CATEGORICAL_COLS)
N_OUTS = 2

data = []
labels = []
good=0
bad=0
with open('data/ops.json') as f:
    for l in f.readlines():
        try:
            d = json.loads(l)
            if d['kind'] == 'Good':
                good+=1
                if good >= 80000:
                    continue
            else:
                bad+=1
                if bad >= 80000:
                    continue
            fs = [float(f) for f in d['features']]
            if N_OUTS == 1:
                l = [1.] if d['kind'] == 'Bad' else [-1.]
            else:
                l = [1., 0.] if d['kind'] == 'Bad' else [0., 1.]
        except:
            continue
        data.append(fs)
        labels.append(l)
data = np.array(data)
labels = np.array(labels)


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

x = tf.placeholder(tf.float32, [None, N_CATS], name='x')
W = tf.Variable(tf.zeros([N_CATS, N_OUTS]), name='W')
b = tf.Variable(tf.zeros([N_OUTS]), name='b')

variable_summaries(W,'W')
variable_summaries(b,'b')

y = tf.matmul(x, W) + b

y_ = tf.placeholder(tf.float32, [None, N_OUTS], name='y_')

with tf.name_scope('cross_entropy'):
    cross_entropy = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits(y, y_), name='xentropy_mean')
    tf.scalar_summary('cross_entropy', cross_entropy)
with tf.name_scope('train'):
    train_step = tf.train.GradientDescentOptimizer(0.5).minimize(cross_entropy)
    #train_step = tf.train.AdamOptimizer(0.1).minimize(cross_entropy)

sess = tf.InteractiveSession()
merged = tf.merge_all_summaries()
summary_writer = tf.train.SummaryWriter('/tmp', sess.graph)
tf.initialize_all_variables().run()

if N_OUTS == 2:
    correct_prediction = tf.equal(tf.argmax(y,1), tf.argmax(y_,1))
else:
    correct_prediction = tf.equal(tf.sign(y), y_)
accuracy = tf.reduce_mean(tf.cast(correct_prediction, tf.float32))

for i in range(1000):
    batch_xs = data[i*100 : i*100 + 100]
    batch_ys = labels[i*100 : i*100 + 100]
    summary_str, _, acc = sess.run([merged, train_step, accuracy], feed_dict={x: batch_xs, y_: batch_ys})
    summary_writer.add_summary(summary_str, i)
    print('Accuracy at step %s: %s' % (i, acc))

print(data.shape)
print(sess.run(accuracy, feed_dict={x: data[100001:], y_: labels[100001:]}))
# print(sess.run(y, feed_dict={x: [data[10001]], y_: [labels[10001]]}))
print('W', sess.run(W))
print('b', sess.run(b))
