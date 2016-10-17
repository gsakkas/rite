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

x = tf.placeholder(tf.float32, [None, N_CATS])
W = tf.Variable(tf.zeros([N_CATS, N_OUTS]))
b = tf.Variable(tf.zeros([N_OUTS]))

y = tf.matmul(x, W) + b

y_ = tf.placeholder(tf.float32, [None, N_OUTS])

#cross_entropy = tf.reduce_mean(-tf.reduce_sum(y_ * tf.log(y), reduction_indices=[1]))
with tf.name_scope('cross_entropy'):
    cross_entropy = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits(y, y_))
    tf.scalar_summary('cross_entropy', cross_entropy)
with tf.name_scope('train'):
    train_step = tf.train.GradientDescentOptimizer(0.5).minimize(cross_entropy)

sess = tf.InteractiveSession()
summary_writer = tf.train.SummaryWriter('/tmp', sess.graph)
tf.initialize_all_variables().run()



## FIXME: 1.0 accuracy even with no training?? wtf is going on
for i in range(100):
    #batch_xs, batch_ys = mnist.train.next_batch(100)
    batch_xs = data[i*100 : i*100 + 100]
    batch_ys = labels[i*100 : i*100 + 100]
    # print batch_xs
    # print batch_ys
    # batch_xs = [d['features'] for d in batch]
    # batch_ys = [[1] if d['kind'] == 'Bad' else [0] for d in batch]
    summary_str = sess.run(train_step, feed_dict={x: batch_xs, y_: batch_ys})
    summary_writer.add_summary(summary_str, i)

#sess.run(train_step, feed_dict={x: data[1:2], y_: [[1., 0.]]})



# all_xs = [d['features'] for d in data[100000:]]
# all_ys = [[1] if d['kind'] == 'Bad' else [0] for d in data[100000:]]

correct_prediction = tf.equal(tf.argmax(y,1), tf.argmax(y_,1))
accuracy = tf.reduce_mean(tf.cast(correct_prediction, tf.float32))
print(data.shape)
print(labels.shape)
print(sess.run(accuracy, feed_dict={x: data[10001:], y_: labels[10001:]}))


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
