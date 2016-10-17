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
N_OUTS = 2  # why does it claim 100% accuracy if i set this to 1??


## Loading Data
data = []
labels = []
# good = 0 # 6057289
# bad = 0  #   69391
with open('data/ops.json') as f:
    for l in f.readlines():
        try:
            d = json.loads(l)
            # if d['kind'] == 'Good' and random.choice(range(1,100)) != 1:
            #     continue
            fs = [float(f) for f in d['features']]
            if N_OUTS == 1:
                l = [1.] if d['kind'] == 'Bad' else [0.]
            else:
                l = [1., 0.] if d['kind'] == 'Bad' else [0., 1.]
            # if d['kind'] == 'Good':
            #     good+=1
            # elif d['kind'] == 'Bad':
            #     bad+=1
            # else:
            #     die
        except:
            continue
        data.append(fs)
        labels.append(l)
data = np.array(data)
labels = np.array(labels)
print data
print labels

# print good, bad
# die

## Helper functions
def weight_variable(shape):
  initial = tf.truncated_normal(shape, stddev=0.1)
  return tf.Variable(initial)

def bias_variable(shape):
  initial = tf.constant(0.1, shape=shape)
  return tf.Variable(initial)

def conv2d(x, W):
  return tf.nn.conv2d(x, W, strides=[1, 1, 1, 1], padding='SAME')

def max_pool_2x2(x):
  return tf.nn.max_pool(x, ksize=[1, 2, 2, 1],
                        strides=[1, 2, 2, 1], padding='SAME')

## Computation Graph

x = tf.placeholder(tf.float32, [None, N_CATS])
W = tf.Variable(tf.zeros([N_CATS, N_OUTS]))
b = tf.Variable(tf.zeros([N_OUTS]))

y = tf.matmul(x, W) + b

y_ = tf.placeholder(tf.float32, [None, N_OUTS])

# convolution
W_conv1 = weight_variable([1, 2, 1, 1]) # add feature for each pair of features
b_conv1 = bias_variable([1])

x_image = tf.reshape(x, [-1,5,4,1])

h_conv1 = tf.nn.relu(conv2d(x_image, W_conv1) + b_conv1)
h_pool1 = max_pool_2x2(h_conv1)

W_conv2 = weight_variable([1, 2, 1, 2]) # 2 features for each pair of features
b_conv2 = bias_variable([2])

h_conv2 = tf.nn.relu(conv2d(h_pool1, W_conv2) + b_conv2)
h_pool2 = max_pool_2x2(h_conv2)

W_fc1 = weight_variable([N_CATS, 100])
b_fc1 = bias_variable([100])

h_pool2_flat = tf.reshape(x, [-1, N_CATS])
h_fc1 = tf.nn.relu(tf.matmul(h_pool2_flat, W_fc1) + b_fc1)

keep_prob = tf.placeholder(tf.float32)
h_fc1_drop = tf.nn.dropout(h_fc1, keep_prob)

W_fc2 = weight_variable([100, N_OUTS])
b_fc2 = bias_variable([N_OUTS])

y_conv = tf.matmul(h_fc1_drop, W_fc2) + b_fc2

cross_entropy = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits(y_conv, y_))
train_step = tf.train.AdamOptimizer(1e-4).minimize(cross_entropy)
#train_step = tf.train.GradientDescentOptimizer(0.5).minimize(cross_entropy)

sess = tf.InteractiveSession()
tf.initialize_all_variables().run()

summary_writer = tf.train.SummaryWriter('.', sess.graph)

## Training
for i in range(1000):
    #batch_xs, batch_ys = mnist.train.next_batch(100)
    batch_xs = data[i*100 : i*100 + 100]
    batch_ys = labels[i*100 : i*100 + 100]
    # print batch_xs
    # print batch_ys
    # batch_xs = [d['features'] for d in batch]
    # batch_ys = [[1] if d['kind'] == 'Bad' else [0] for d in batch]
    summary_str = sess.run(train_step, feed_dict={x: batch_xs, y_: batch_ys, keep_prob: 0.5})
    summary_writer.add_summary(summary_str, i)

#sess.run(train_step, feed_dict={x: data[1:2], y_: [[1., 0.]]})



# all_xs = [d['features'] for d in data[100000:]]
# all_ys = [[1] if d['kind'] == 'Bad' else [0] for d in data[100000:]]

correct_prediction = tf.equal(tf.argmax(y,1), tf.argmax(y_,1))
accuracy = tf.reduce_mean(tf.cast(correct_prediction, tf.float32))
print(data.shape)
print(labels.shape)
print(sess.run(accuracy, feed_dict={x: data, y_: labels, keep_prob: 1.0}))


# def input_fn(df):
#     categorical_cols = {k: tf.SparseTensor(
#         indices=[[i,0] for i in range(df[k].size)],
#         values=df[k].values,
#         shape=[df[k].size, 1])
#                         for k in CATEGORICAL_COLS
#     }
#     label = tf.constant(CATEGORICAL_COLS)
#     return feature_cols, label

# def train_input_fn():
#   return input_fn(df_train)

# def eval_input_fn():
#   return input_fn(df_test)

# features = set()
# with open('../nanoml/bad-programs.json') as f:
#     for l in f.readlines():
#         try:
#             d = json.loads(l)
#         except:
#             continue
#         print len(d['features'])
#         break
    #     print d['loc']
    #     features = features.union(set(k for fs in d['features'].values() for k in fs.keys()))
    # print features
