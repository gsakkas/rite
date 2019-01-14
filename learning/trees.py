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

train_samps = train.loc[:, 'F-Is-Eq':]
print train_samps.shape
# train_labels = train.loc[:, 'L-DidChange']
train_labels = train.loc[:, 'L-Cluster0':'L-Cluster29']

test_samps = test.loc[:, 'F-Is-Eq':]
del test_samps['SOURCE_FILE']
# test_labels = test.loc[:, 'L-DidChange']
test_labels = test.loc[:, 'L-Cluster0':'L-Cluster29']
test_span = test.loc[:, 'SourceSpan']
test_file = test.loc[:, 'SOURCE_FILE']
print test_samps.shape
# print test.iloc[1]
# print test.values[1]

# dflist = []
# keylist = []
# for key, value in df.iteritems():
#     temp = value
#     tempk = key
#     dflist.append(temp)
#     keylist.append(tempk)
# Y = dflist[0]
# X = dflist[2:]

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
clf = clf.fit(train_samps.values, train_labels.values)

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

# -------importances

# imps = clf.feature_importances_
# imp_features = [(y,x) for (y,x) in sorted(zip(imps,fs))]
# imp_features.reverse()
# for elem in imp_features:
#         print elem
# ------------------

# testanses =test_labels.values
# resacc = anses + 2*test_labels.values
# acc = 1-((sum(abs(anses - test_labels.values)))/3600)

# lol = test_labels.add((-1)*anses)

# print lol

# print map(lambda x : clf.predict_proba(x), test_samps.values)
prob_score = clf.predict_proba(test_samps.values)
print len(prob_score)
print len(prob_score[0])

# prob_error = [item[1] for item in prob_score]
prob_error = []
if model == 'mlp':
    prob_error = [[1.0 - i for i in item] for item in prob_score]
else:
    prob_error = [[i[1] for i in item] for item in zip(*prob_score)]
# print len(prob_error)
# print len(prob_error[0])

# print prob_error

ll = zip(prob_error, anses, test_labels.values, test_span)

score = pd.DataFrame(
    data=ll,
    index=test_labels.index,
    columns=['Error Probability', 'predictions', 'actual', 'SourceSpan'])

# print score
# print score.loc[0]

# print 'recall is ' + str(sum(anses * test_labels.values)/sum(test_labels.values))
# print 'precision is ' + str(sum(anses * test_labels.values)/sum(anses))

yay1 = 0
yay2 = 0
yay3 = 0
tots = 0
tp = 0

# print len(list(test_labels.index))
# print len(list(set(test_labels.index)))

# for labelind in list(set(test_labels.index)):
#     # print labelind
#     temp = score.loc[labelind]
#     temp = temp.values
#     # print temp
#     # if len(temp) < 3:
#     #   continue
#     tots = tots + 1
#     # this complicated thing takes the *most likely bad* things
#     # followed by the *least likely good* things, in case we have
#     # fewer than 3 "bad" predictions
#     bad = temp[np.argsort(temp[:, 0])][::-1]
#     # print bad
#     # print bad[bad[:,1] == 1]
#     good = temp[np.argsort(temp[:, 0])]
#     # print good
#     # print good[good[:,1] == 0]
#     topn = np.concatenate((bad[bad[:, 1] == 1], good[good[:, 1] == 0]))[:3]
#     # temp[np.argsort(temp[:,0])],
#     # temp[np.argsort(temp[temp[:,1] == 0][:,0])[::-1]]))[:3]
#     # filenm = str(labelind).split('.')
#     # print topn
#     # raise 'he'
#     filenm = test_file.loc[labelind].values[0].split('.')
#     dir = os.path.join(test_dir, model)
#     if not os.path.exists(dir):
#         os.mkdir(dir)
#     f = open(dir + '/' + filenm[0] + '.ml.out', "w+")
#     for preds in topn:
#         # if preds[1] == 1:
#         f.write(str(preds[3]) + '\n')

#     f.close()
#     # print topn
#     # print 'lol'
#     # print topn[-3:]
#     a3 = 0
#     a2 = 0
#     a1 = 0
#     if (len(topn) >= 3 and topn[2][1] == 1 and topn[2][2] == 1):
#         a3 = 1
#         tp = tp + 1
#     if (topn[1][1] == 1 and topn[1][2] == 1):
#         a3 = 1
#         a2 = 1
#         tp = tp + 1
#     if (topn[0][1] == 1 and topn[0][2] == 1):
#         a3 = 1
#         a2 = 1
#         a1 = 1
#         tp = tp + 1
#     yay1 = yay1 + a1
#     yay2 = yay2 + a2
#     yay3 = yay3 + a3

for i, temp in enumerate(test_labels.values):
    tots = tots + 1
    if 1 in temp.tolist():
        idx = temp.tolist().index(1)
        pes = np.argsort(prob_error[i])
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


print "precision for top 3"
print 'top 1'
print float(yay1) / tots
print 'top 2'
print float(yay2) / tots
print 'top 3'
print float(yay3) / tots
# print tots
# print tp
# print sum(test_labels.values)
# print "recall for top 3"
# print tp / sum(test_labels.values)
