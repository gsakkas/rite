import os.path
import sys

import sklearn
from sklearn import tree, neural_network
from sklearn.ensemble import RandomForestClassifier
from sklearn.dummy import DummyClassifier
from sklearn.multiclass import OneVsRestClassifier
from sklearn.model_selection import GridSearchCV
from sklearn.preprocessing import StandardScaler
import joblib
import numpy as np
import pandas as pd

import input_old

model = sys.argv[1]
if model not in ['mlp', 'decision-tree', 'random-forest', 'uniform', 'stratified', 'load']:
    print('python predict_fixes.py [mlp|decision-tree|random-forest|uniform|stratified|load] <train> <test> <load-model>')
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
    df2['SOURCE_FILE'] = csv
    test.append(df2)

train = pd.concat(train)
print(train.shape)
test = pd.concat(test)
print(test.shape)

# Maximum number of clusters in files
max_num_cls = 50

# Number of cluster-labels to use
num_of_cls = 50
print("Clusters =", num_of_cls)

# The segment below is supposed to balance each class
# by adding multiple random samples from the training datset
classes = list(train.groupby(ls2))
max_samples = max(len(c) for _, c in classes)
num_of_samples = int(2 * train.shape[0] / len(classes)) if len(classes) * max_samples > 2 * train.shape[0] else max_samples
train = pd.concat(c.sample(num_of_samples, replace=True) for _, c in classes)

last_L = 'L-Cluster' + str(num_of_cls)

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


train_samps = train.loc[:, 'F-Expr-Size':]
print(train_samps.shape)
train_labels = train.loc[:, 'L-Cluster1':last_L]
train_labels = categorize(train_labels)

test_samps = test.loc[:, 'F-Expr-Size':]
del test_samps['SOURCE_FILE']
print(test_samps.shape)
test_labels = test.loc[:, 'L-Cluster1':last_L]
test_labels = categorize(test_labels)
test_span = test.loc[:, 'SourceSpan']
test_file = test.loc[:, 'SOURCE_FILE']

clf = DummyClassifier(random_state=prng)

if model == 'mlp':
    clf = neural_network.MLPClassifier(
        hidden_layer_sizes=(128, 128),
        learning_rate='adaptive',
        learning_rate_init=0.001,
        alpha=0.001,
        max_iter=500,
        verbose=True,
        # solver='lbfgs',
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
elif model == 'stratified':
    clf = DummyClassifier(random_state=prng)
elif model == 'uniform':
    clf = DummyClassifier(strategy='uniform', random_state=prng)
else:
    clf = joblib.load(model_file)


parameters = {'hidden_layer_sizes': ((256, 128), (128, 128), (128, 64)),
              'alpha': [0.001, 0.0001],
              'verbose': [False]}

#Standarize the data
# scaler = StandardScaler()
# train_stds = scaler.fit_transform(train_samps.values)
train_stds = train_samps.values

# Type of model training to use
clf_type = 'multiclass' # "ova" of "multiclass"

if model != 'load':
    if clf_type == 'ova' or clf_type == 'big-ova':
        clf = OneVsRestClassifier(clf, n_jobs=-1).fit(train_stds, train_labels.values)
    else:
        clf = GridSearchCV(clf, parameters, scoring='f1_weighted', cv=5, verbose=2, n_jobs=-1)
        clf = clf.fit(train_stds, train_labels.values)
        print(clf.best_params_)

    if model != 'uniform' and model != 'stratified':
        joblib.dump(
            clf,
            os.path.join('models', model + '-' + str(num_of_cls) + '-' + clf_type + '_final.pkl'))
else:
    model = 'mlp'

# test_stds = scaler.transform(test_samps.values)
test_stds = test_samps.values
anses = clf.predict(test_stds)

prob_score = clf.predict_proba(test_stds)
# print(len(prob_score))
# print(len(prob_score[0]))

prob_error = []
prob_error = [[1.0 - i for i in item] for item in prob_score]
prob_error = [np.argsort(pe).tolist() for pe in prob_error]
# print(len(prob_error))
# print(len(prob_error[0]))

pes_top5 = [pe[:5] for pe in prob_error]
pes1, pes2, pes3, pes4, pes5 = map(list, zip(*pes_top5))
ll = list(zip(test_span, pes1, pes2, pes3, pes4, pes5, test_labels.values))

score = pd.DataFrame(data=ll, index=test_labels.index, columns=['SourceSpan', 'P-1', 'P-2', 'P-3', 'P-4', 'P-5', 'Actual'])

all_programs = 0
c1 = 0
c3 = 0
c5 = 0
c1_whole = 0
c3_whole = 0
c5_whole = 0
for labelind in list(set(test_labels.index)):
    all_programs += 1
    temp_sc = score.loc[[labelind]]
    yay1 = 0
    yay3 = 0
    yay5 = 0
    total = 0
    for sc in temp_sc.values:
        act = sc[6]
        total += 1
        if sc[1] == act or sc[2] == act or sc[3] == act or sc[4] == act or sc[5] == act:
            yay5 += 1
        if sc[1] == act or sc[2] == act or sc[3] == act:
            yay3 += 1
        if sc[1] == act:
            yay1 += 1
    c1 += float(yay1) * 100 / total
    c3 += float(yay3) * 100 / total
    c5 += float(yay5) * 100 / total

    c1_whole += yay1 / total
    c3_whole += yay3 / total
    c5_whole += yay5 / total

    if model != 'load' and model != 'uniform' and model != 'stratified':
        filenm = test_file.loc[[labelind]].values[0].split('.')
        res_dir = os.path.join(test_dir, model + '-' + str(num_of_cls) + '-' + clf_type + '-lbfgs')
        if not os.path.exists(res_dir):
            os.mkdir(res_dir)
        temp_sc.to_csv(res_dir + '/' + filenm[0] + '.csv', index=False)

yay1 = 0
yay2 = 0
yay3 = 0
yay5 = 0
yay_all = 0
yay1_2 = 0
yay2_2 = 0
yay3_2 = 0
yay5_2 = 0
tots = 0
real_tots = 0
yays1 = [0] * num_of_cls
yays2 = [0] * num_of_cls
yays3 = [0] * num_of_cls
yays5 = [0] * num_of_cls
alls = [0] * num_of_cls
for i, idx in enumerate(test_labels.values):
    real_tots += 1
    pes = prob_error[i]
    # print(pes)
    # print(idx)
    if pes[0] != anses[i]:
        print('NOT OK')
    # print(pes[:5])

    if pes[0] == idx or pes[1] == idx or pes[2] == idx or pes[3] == idx or pes[4] == idx:
        yay5_2 += 1
    if pes[0] == idx or pes[1] == idx or pes[2] == idx:
        yay3_2 += 1
    if pes[0] == idx or pes[1] == idx:
        yay2_2 += 1
    if pes[0] == idx:
        yay1_2 += 1

    if idx > 0:
        tots += 1
        alls[idx - 1] += 1
        # 0 is for unclassified
        pes.remove(0)
        if pes[0] == idx or pes[1] == idx or pes[2] == idx or pes[3] == idx or pes[4] == idx:
            yay5 += 1
            yays5[idx - 1] += 1
        if pes[0] == idx or pes[1] == idx or pes[2] == idx:
            yay3 += 1
            yays3[idx - 1] += 1
        if pes[0] == idx or pes[1] == idx:
            yay2 += 1
            yays2[idx - 1] += 1
        if pes[0] == idx:
            yay1 += 1
            yays1[idx - 1] += 1

print("accuracy for top 5 per class (" + str(num_of_cls) + ")")
print("top 1")
print([float(x) * 100 / y if y != 0 else 0.0 for x, y in zip(yays1, alls)])
print("top 2")
print([float(x) * 100 / y if y != 0 else 0.0 for x, y in zip(yays2, alls)])
print("top 3")
print([float(x) * 100 / y if y != 0 else 0.0 for x, y in zip(yays3, alls)])
print("top 5")
print([float(x) * 100 / y if y != 0 else 0.0 for x, y in zip(yays5, alls)])

print("accuracy for top 5")
print("top 1")
print(float(yay1) * 100 / tots)
print("top 2")
print(float(yay2) * 100 / tots)
print("top 3")
print(float(yay3) * 100 / tots)
print("top 5")
print(float(yay5) * 100 / tots)

print("accuracy for top 5 (with unclassified)")
print("top 1")
print(float(yay1_2) * 100 / real_tots)
print("top 2")
print(float(yay2_2) * 100 / real_tots)
print("top 3")
print(float(yay3_2) * 100 / real_tots)
print("top 5")
print(float(yay5_2) * 100 / real_tots)

print("accuracy for top 5 (average acc. per program)")
print("top 1")
print(float(c1) / all_programs)
print("top 3")
print(float(c3) / all_programs)
print("top 5")
print(float(c5) / all_programs)

print("accuracy for top 5 (acc. per program)")
print("top 1")
print(float(c1_whole) * 100 / all_programs)
print("top 3")
print(float(c3_whole) * 100 / all_programs)
print("top 5")
print(float(c5_whole) * 100 / all_programs)