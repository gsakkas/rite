import sys
from os.path import join, dirname, exists, isfile
from os import listdir, mkdir, environ
import matplotlib.pyplot as plt
import random as rn

import sklearn
from sklearn import tree, neural_network
from sklearn.ensemble import RandomForestClassifier
from sklearn.dummy import DummyClassifier
from sklearn.multiclass import OneVsRestClassifier
from sklearn.model_selection import GridSearchCV
from sklearn.preprocessing import StandardScaler
from sklearn.cluster import KMeans
from sklearn.cluster import AgglomerativeClustering
from matplotlib import pyplot as plt
from scipy.cluster.hierarchy import dendrogram
import joblib
import numpy as np
import pandas as pd

import input_old

model = sys.argv[1]
if model not in ['kmeans', 'hierarch', 'load']:
    print('python predict_fixes.py [kmeans|hierarch|load] <train> <test> <load-model>')
    sys.exit(1)
train_dir = sys.argv[2]
test_dir = sys.argv[3]
model_file = ''
if model == 'load':
    model_file = sys.argv[4]

# The below is necessary to get reproducible results
RANDOM_SEED = 42
environ['PYTHONHASHSEED'] = str(RANDOM_SEED)
np.random.seed(RANDOM_SEED)
prng = np.random.RandomState(RANDOM_SEED)
rn.seed(RANDOM_SEED)


train_csvs = sorted([f for f in listdir(train_dir) if f.endswith('.csv') and not f.startswith('train')])
test_csvs = sorted([f for f in listdir(test_dir) if f.endswith('.csv') and not f.startswith('test')])

train_file = join(dirname(train_dir), "train_changed_errors.csv")
test_file = join(dirname(test_dir), "test_changed_errors.csv")

sklearn.utils.shuffle(train_csvs, random_state=prng)
train = []
test = []

if isfile(train_file):
    train = pd.read_csv(train_file)
else:
    for csv in train_csvs:
        df, fs, ls = input_old.load_csv(
            join(train_dir, csv), filter_no_labels=False, only_slice=False)
        if df is None:
            continue
        if df.shape[0] == 0:
            continue
        df['SOURCE_FILE'] = csv
        df = df[df.loc[:, 'L-DidChange'] == 1.0]
        train.append(df)
    train = pd.concat(train)
    train.to_csv(train_file, index=False, encoding='utf-8')

if isfile(test_file):
    test = pd.read_csv(test_file)
else:
    for csv in test_csvs:
        df2, fs2, ls2 = input_old.load_csv(
            join(test_dir, csv), filter_no_labels=False, only_slice=False)
        if df2 is None:
            continue
        if df2.shape[0] == 0:
            continue
        df2['SOURCE_FILE'] = csv
        df2 = df2[df2.loc[:, 'L-DidChange'] == 1.0]
        test.append(df2)
    test = pd.concat(test)
    test.to_csv(test_file, index=True, encoding='utf-8')

print(train.shape)
print(test.shape)

# The segment below is supposed to balance each class
# by adding multiple random samples from the training datset
# classes = list(train.groupby(ls2))
# max_samples = max(len(c) for _, c in classes)
# num_of_samples = int(2 * train.shape[0] / len(classes)) if len(classes) * max_samples > 2 * train.shape[0] else max_samples
# train = pd.concat(c.sample(num_of_samples, replace=True) for _, c in classes)

train_samps = train.loc[:, 'F-Expr-Size':]
del train_samps['SOURCE_FILE']
train_span = train.loc[:, 'SourceSpan']
train_file = train.loc[:, 'SOURCE_FILE']
# print(train_samps.shape)
# train_labels = train.loc[:, 'L-DidChange']

test_samps = test.loc[:, 'F-Expr-Size':]
del test_samps['SOURCE_FILE']
# print(test_samps.shape)
# test_labels = test.loc[:, 'L-DidChange']
test_span = test.loc[:, 'SourceSpan']
test_file = test.loc[:, 'SOURCE_FILE']

n_clusts = 57
clf = KMeans(n_clusters=n_clusts)

if model == 'hierarch':
    # clf = AgglomerativeClustering(n_clusters=None, distance_threshold=0)
    clf = AgglomerativeClustering(n_clusters=n_clusts)
elif model == 'load':
    clf = joblib.load(model_file)

#Standarize the data
# scaler = StandardScaler()
# train_stds = scaler.fit_transform(train_samps.values)
train_stds = train_samps.values

if model != 'load':
    clf = clf.fit(train_stds)
    if model != 'uniform' and model != 'stratified':
        joblib.dump(
            clf,
            join('models', model + '-error-cluster.pkl'))

# test_stds = scaler.transform(test_samps.values)
# test_stds = test_samps.values
# anses = clf.predict(test_stds)

### Code from scikit-learn
if model == 'hierarch':
    def plot_dendrogram(model, **kwargs):
        # Create linkage matrix and then plot the dendrogram
        # create the counts of samples under each node
        counts = np.zeros(model.children_.shape[0])
        n_samples = len(model.labels_)
        for i, merge in enumerate(model.children_):
            current_count = 0
            for child_idx in merge:
                if child_idx < n_samples:
                    current_count += 1  # leaf node
                else:
                    current_count += counts[child_idx - n_samples]
            counts[i] = current_count

        linkage_matrix = np.column_stack([model.children_, model.distances_,
                                        counts]).astype(float)

        # Plot the corresponding dendrogram
        dendrogram(linkage_matrix, **kwargs)

    # plt.title('Hierarchical Clustering Dendrogram')
    # # plot the top p levels of the dendrogram
    # plot_dendrogram(clf, truncate_mode='level', p=5)
    # plt.xlabel("Number of points in node (or index of point if no parenthesis).")
    # plt.show()

    res_dir = join(train_dir, 'error_clusters')
    if not exists(res_dir):
        mkdir(res_dir)

    lbls = list(zip(train_file, train_span, clf.labels_))

    # print(set(clf.labels_))
    # print(list(lbls))
    for cl in range(n_clusts):
        ll = []
        for lbl in lbls:
            if lbl[2] == cl:
                ll.append(lbl[:2])
        print(len(ll))
        cls_data = pd.DataFrame(data=ll, columns=['file', 'SourceSpan'])
        cls_data.to_csv(res_dir + '/' + str(cl) + '.csv', index=False)
