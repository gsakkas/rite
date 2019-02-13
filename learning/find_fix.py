import os.path
import sys

import sklearn
from sklearn import tree, neural_network
from sklearn.ensemble import RandomForestClassifier
from sklearn.externals import joblib
import numpy as np
import pandas as pd

import input_old

model = sys.argv[1]
if model not in ['mlp', 'decision-tree', 'random-forest']:
    print 'python trees.py [mlp|decision-tree|random-forest] <train> <test>'
    sys.exit(1)
train_dir = sys.argv[2]
test_dir = sys.argv[3]

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

# Number of cluster-labels to use
num_of_cls = 40

# Remove all -1 from labels
# The -1s are there because of the type-checking
# of the label in the relevant program hole
lbls = {}
for i in xrange(1, num_of_cls + 1):
    lbls['L-Cluster' + str(i)] = -1.0

train_binary = train.replace(lbls, 0.0)

# The segment below is supposed to balance each class
# by adding multiple random samples from the training datset
classes = list(train_binary.groupby(ls2))
max_samples = max(len(c) for _, c in classes)
num_of_samples = 10 * train_binary.shape[0] / len(classes) if len(classes) * max_samples > 10 * train_binary.shape[0] else max_samples
train_binary = pd.concat(c.sample(num_of_samples, replace=True) for _, c in classes)

last_L = 'L-Cluster' + str(num_of_cls)

train_samps = train_binary.loc[:, 'F-Is-Eq':]
print train_samps.shape
train_labels = train_binary.loc[:, 'L-Cluster1':last_L]

test_samps = test.loc[:, 'F-Is-Eq':]
test_labels = test.loc[:, 'L-Cluster1':last_L]
test_span = test.loc[:, 'SourceSpan']
print test_samps.shape

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
        tol=0.00001,
        random_state=prng,
    )
elif model == 'random-forest':
    clf = RandomForestClassifier(n_estimators=100,
                                 max_depth=5,
                                 random_state=prng)
else:
    clf = tree.DecisionTreeClassifier(random_state=prng)

clf = clf.fit(train_samps.values, train_labels.values)

joblib.dump(
    clf,
    os.path.join('models', model + '-' + train_dir.replace('/', '-') + '.pkl'))

anses = clf.predict(test_samps.values)

prob_score = clf.predict_proba(test_samps.values)
print len(prob_score)
print len(prob_score[0])

prob_error = []
if model == 'mlp':
    prob_error = [[1.0 - i for i in item] for item in prob_score]
else:
    prob_error = [[i[1] for i in item] for item in zip(*prob_score)]

yay1 = 0
yay2 = 0
yay3 = 0
tots = 0
tp = 0
for i, temp in enumerate(test_labels.values):
    tots = tots + 1
    if 1 in temp.tolist():
        idx = temp.tolist().index(1)
        pes = np.argsort(prob_error[i]).tolist()
        not_valid = np.where(temp == -1.0)[0].tolist()
        for nv in not_valid:
            pes.remove(nv)
        if pes[0] == idx or pes[1] == idx or pes[2] == idx:
            yay3 += 1
        if pes[0] == idx or pes[1] == idx:
            yay2 += 1
        if pes[0] == idx:
            yay1 += 1
    elif 1 not in anses[i].tolist():
        yay3 += 1
        yay2 += 1
        yay1 += 1

print "accuracy for top 3"
print 'top 1'
print float(yay1) * 100 / tots
print 'top 2'
print float(yay2) * 100 / tots
print 'top 3'
print float(yay3) * 100 / tots
