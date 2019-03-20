import os.path
import sys

import sklearn
from sklearn import tree, neural_network
from sklearn.ensemble import RandomForestClassifier
from sklearn.dummy import DummyClassifier
from sklearn.externals import joblib
import numpy as np
import pandas as pd

import input_old

model = sys.argv[1]
if model not in ['mlp', 'decision-tree', 'random-forest', 'random', 'load']:
    print 'python trees.py [mlp|decision-tree|random-forest|random|load] <train> <test>'
    sys.exit(1)
train_dir = sys.argv[2]
test_dir = sys.argv[3]
model_file = ''
if model == 'load':
    model_file = sys.argv[4]

RANDOM_SEED = 0
np.random.seed(RANDOM_SEED)
prng = np.random.RandomState(RANDOM_SEED)

# TODO: sort??
train_csvs = sorted([f for f in os.listdir(train_dir) if f.endswith('.csv')])
test_csvs = sorted([f for f in os.listdir(test_dir) if f.endswith('.csv')])

sklearn.utils.shuffle(train_csvs, random_state=prng)
dfs = []
test = []
train = []

for csv in train_csvs:
    df, fs, ls = input_old.load_csv(
        os.path.join(train_dir, csv), filter_no_labels=False, only_slice=False)
    if df is None:
        continue
    if df.shape[0] == 0:
        continue
    train.append(df)

for csv in test_csvs:
    df2, fs2, ls2 = input_old.load_csv(
        os.path.join(test_dir, csv), filter_no_labels=False, only_slice=False)
    if df2 is None:
        continue
    if df2.shape[0] == 0:
        continue
    test.append(df2)

train = pd.concat(train)
print train.shape
test = pd.concat(test)
print test.shape

# Maximum number of clusters in files
max_num_cls = 41

# Number of cluster-labels to use
num_of_cls = 20
print "Clusters =", num_of_cls

# Remove all -1 from labels
# The -1s are there because of the type-checking
# of the label in the relevant program hole
lbls = {}
for i in xrange(1, max_num_cls + 1):
    lbls['L-Cluster' + str(i)] = -1.0

train_binary = train.replace(lbls, 0.0)

# The segment below is supposed to balance each class
# by adding multiple random samples from the training datset
classes = list(train_binary.groupby(ls2))
max_samples = max(len(c) for _, c in classes)
num_of_samples = 10 * train_binary.shape[0] / len(classes) if len(classes) * max_samples > 10 * train_binary.shape[0] else max_samples
train_binary = pd.concat(c.sample(num_of_samples, replace=True) for _, c in classes)

last_L = 'L-Cluster' + str(num_of_cls)

train_samps = train_binary.loc[:, 'F-Expr-Size':]
print train_samps.shape
train_labels = train_binary.loc[:, 'L-Cluster1':last_L]

test_samps = test.loc[:, 'F-Expr-Size':]
print test_samps.shape
test_labels = test.loc[:, 'L-Cluster1':last_L]
test_span = test.loc[:, 'SourceSpan']

clf = DummyClassifier(random_state=prng)

if model == 'mlp':
    clf = neural_network.MLPClassifier(
        hidden_layer_sizes=(160, 40),
        learning_rate='adaptive',
        learning_rate_init=0.001,
        alpha=0.001,
        max_iter=500,
        verbose=True,
        # solver='sgd',
        # early_stopping=True,
        # tol=0.00001,
        random_state=prng,
    )
elif model == 'random-forest':
    clf = RandomForestClassifier(n_estimators=100,
                                 max_depth=5,
                                 random_state=prng)
elif model == 'decision-tree':
    clf = tree.DecisionTreeClassifier(random_state=prng)
elif model == 'random':
    clf = DummyClassifier(random_state=prng)
else:
    clf = joblib.load(model_file)

if model != 'load':
    clf = clf.fit(train_samps.values, train_labels.values)

    joblib.dump(
        clf,
        os.path.join('models', model + '-' + str(num_of_cls) + '.pkl'))

anses = clf.predict(test_samps.values)

prob_score = clf.predict_proba(test_samps.values)
# print len(prob_score)
# print len(prob_score[0])

prob_error = []
if model == 'mlp' or model == 'load':
    prob_error = [[1.0 - i for i in item] for item in prob_score]
else:
    prob_error = [[i[1] for i in item] for item in zip(*prob_score)]

yay1 = 0
yay2 = 0
yay3 = 0
yay1_2 = 0
yay2_2 = 0
yay3_2 = 0
tots = 0
real_tots = 0
yays1 = [0] * num_of_cls
yays2 = [0] * num_of_cls
yays3 = [0] * num_of_cls
alls = [0] * num_of_cls
for i, temp in enumerate(test_labels.values):
    real_tots += 1
    pes = np.argsort(prob_error[i]).tolist()
    # not_valid = np.where(temp == -1.0)[0].tolist()
    # for nv in not_valid:
    #     pes.remove(nv)
    # print "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    # print temp.tolist()
    # print pes
    if 1 in temp.tolist():
        tots += 1
        idx = temp.tolist().index(1)
        alls[idx] += 1
        if pes[0] == idx or pes[1] == idx or pes[2] == idx:
            yay3 += 1
            yays3[idx] += 1
        if pes[0] == idx or pes[1] == idx:
            yay2 += 1
            yays2[idx] += 1
        if pes[0] == idx:
            yay1 += 1
            yays1[idx] += 1
    else:
        if len(pes) > 0:
            yay3_2 += 1
            yay2_2 += 1
            yay1_2 += 1

print "accuracy for top 3 per class (" + str(num_of_cls) + ")"
print "top 1"
print [float(x) * 100 / y if y != 0 else 0.0 for x, y in zip(yays1, alls)]
print "top 2"
print [float(x) * 100 / y if y != 0 else 0.0 for x, y in zip(yays2, alls)]
print "top 3"
print [float(x) * 100 / y if y != 0 else 0.0 for x, y in zip(yays3, alls)]

print "accuracy for top 3"
print "top 1"
print float(yay1) * 100 / tots
print "top 2"
print float(yay2) * 100 / tots
print "top 3"
print float(yay3) * 100 / tots

print "accuracy for top 3 (with unclassified)"
print "top 1"
print float(yay1 + yay1_2) * 100 / real_tots
print "top 2"
print float(yay2 + yay2_2) * 100 / real_tots
print "top 3"
print float(yay3 + yay3_2) * 100 / real_tots
