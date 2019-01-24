import os.path
import sys

import sklearn
from sklearn import tree, neural_network
from sklearn.ensemble import RandomForestClassifier
from sklearn.externals import joblib
from sklearn.multiclass import OneVsRestClassifier
import numpy as np
import pandas as pd

import input_old

model = sys.argv[1]
if model not in ['mlp', 'decision-tree', 'random-forest']:
    print 'python trees.py [decision-tree|random-forest] <train> <test>'
    sys.exit(1)
train_dir = sys.argv[2]
test_dir = sys.argv[3]

RANDOM_SEED = 0
np.random.seed(RANDOM_SEED)
prng = np.random.RandomState(RANDOM_SEED)

# FIXME: sort??
train_csvs = sorted([f for f in os.listdir(train_dir) if f.endswith('.csv')])
test_csvs = sorted([f for f in os.listdir(test_dir) if f.endswith('.csv')])

sklearn.utils.shuffle(train_csvs, random_state=prng)
dfs = []
test = []
train = []

for csv in train_csvs:
    df, fs, ls = input_old.load_csv(
        os.path.join(train_dir, csv), filter_no_labels=True, only_slice=False)

    if df is None:
        continue
    if df.shape[0] == 0:
        continue

    train.append(df)

for csv in test_csvs:
    df2, fs2, ls2 = input_old.load_csv(
        os.path.join(test_dir, csv), filter_no_labels=True, only_slice=False)

    if df2 is None:
        continue
    if df2.shape[0] == 0:
        continue

    df2['SOURCE_FILE'] = csv
    test.append(df2)

# print len(test)

train = pd.concat(train)
test = pd.concat(test)

# print (len(test))
# print (len(train))

# print (df.shape)
# print df
classes = list(train.groupby(ls2))
# print(ls)
max_samples = max(len(c) for _, c in classes)
train = pd.concat(c.sample(max_samples, replace=True) for _, c in classes)
print train.shape
# print (len(train))
# print df.shape
# print type(df)
# list_keys = [ k for k in df ]
# print list_keys
# print samps

# print sum(df['L-DidChange'].values)
# print df['L-DidChange'].index


def idmax(x):
    if 1 not in x.values:
        return 0
    else:
        i = 1
        for elem in x.values:
            if elem > 0:
                return i
            i += 1


def categorize(labels):
    return labels.apply(idmax, axis=1).astype('int64')


train_samps = train.loc[:, 'F-Is-Eq':]
print train_samps.shape
# train_labels = train.loc[:, 'L-DidChange']
train_labels = train.loc[:, 'L-Cluster0':'L-Cluster29']
train_labels = categorize(train_labels)
# print train_labels.iloc[1]

test_samps = test.loc[:, 'F-Is-Eq':]
del test_samps['SOURCE_FILE']
# test_labels = test.loc[:, 'L-DidChange']
test_labels = test.loc[:, 'L-Cluster0':'L-Cluster29']
test_labels = categorize(test_labels)
test_span = test.loc[:, 'SourceSpan']
test_file = test.loc[:, 'SOURCE_FILE']
print test_samps.shape
# print test.iloc[1]
# print test.values[1]
# print test_labels

if model == 'mlp':
    clf = neural_network.MLPClassifier(
        hidden_layer_sizes=(100, 20),
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
clf = OneVsRestClassifier(clf, n_jobs=-1).fit(train_samps.values, train_labels.values)

joblib.dump(
    clf,
    os.path.join('models', model + '-' + train_dir.replace('/', '-') + '.pkl'))

# print test_samps
# print test_samps.values
anses = clf.predict(test_samps.values)
# print anses
# print test_labels.values
# print sum(anses)/len(anses)
# print sum(test_labels.values)/len(test_labels.values)

# testanses =test_labels.values
# resacc = anses + 2*test_labels.values
# acc = 1-((sum(abs(anses - test_labels.values)))/3600)

# lol = test_labels.add((-1)*anses)

# print lol

prob_score = clf.predict_proba(test_samps.values)
print len(prob_score)
print len(prob_score[0])

prob_error = []
prob_error = [[1.0 - i for i in item] for item in prob_score]
# print len(prob_error)
# print len(prob_error[0])

yay_all = 0
yay1 = 0
yay2 = 0
yay3 = 0
tots = 0

for i, idx in enumerate(test_labels.values):
    tots = tots + 1
    if idx > 0:
        pes = np.argsort(prob_error[i])
        if pes[0] != anses[i]:
            print 'NOT OK'
        if pes[0] == idx or pes[1] == idx or pes[2] == idx:
            yay3 += 1
        if pes[0] == idx or pes[1] == idx:
            yay2 += 1
        if pes[0] == idx:
            yay1 += 1
        if anses[i] == idx:
            yay_all += 1
    elif anses[i] < 1:
        yay3 += 1
        yay2 += 1
        yay1 += 1
        yay_all += 1


print "precision for top 3"
print 'top 1'
print float(yay1) * 100 / tots
print float(yay_all) * 100 / tots
print 'top 2'
print float(yay2) * 100 / tots
print 'top 3'
print float(yay3) * 100 / tots
