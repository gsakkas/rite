import sys
from os.path import join, dirname, exists, isfile
from os import listdir, mkdir
import matplotlib.pyplot as plt
from functools import reduce

import numpy as np
import pandas as pd
import sklearn
from sklearn.preprocessing import StandardScaler, OneHotEncoder
from sklearn.metrics import confusion_matrix
from sklearn.decomposition import PCA, NMF
from sklearn.svm import SVC
from keras.models import Model
from keras.layers import Dense, Conv2D, MaxPooling2D, Flatten, Input, Dropout
from keras.callbacks import EarlyStopping
from tensorflow import set_random_seed

import input_old

model = sys.argv[1]
if model not in ['dnn', 'cnn', 'svm', 'popular', 'random', 'load', 'load-cnn']:
    print('python predict_fixes.py [dnn|cnn|svm|popular|random|load|load-cnn] <train> <test> <load-model>')
    sys.exit(1)
train_dir = sys.argv[2]
test_dir = sys.argv[3]
model_file = ''
if model == 'load' or model == 'load-cnn':
    model_file = sys.argv[4]

RANDOM_SEED = 0
np.random.seed(RANDOM_SEED)
set_random_seed(RANDOM_SEED)
prng = np.random.RandomState(RANDOM_SEED)

train_csvs = sorted([f for f in listdir(train_dir) if f.endswith('.csv')])
test_csvs = sorted([f for f in listdir(test_dir) if f.endswith('.csv')])

sklearn.utils.shuffle(train_csvs, random_state=prng)
dfs = []
test = []
train = []


# Maximum number of clusters in files
max_num_cls = 50

# Number of cluster-labels to use
num_of_cls = 40

label_names = ['L-Cluster' + str(i) for i in range(1, num_of_cls + 1)]
train_file = join(dirname(train_dir), "train_" + str(num_of_cls) + "_tmpls.csv")
test_file = join(dirname(test_dir), "test_" + str(num_of_cls) + "_tmpls.csv")

if model != 'popular' and model != 'random' and not isfile(train_file):
    for csv in train_csvs:
        df, fs, ls = input_old.load_csv(
            join(train_dir, csv), filter_no_labels=False, only_slice=False)
        if df is None:
            continue
        if df.shape[0] == 0:
            continue
        criteria = (df[l] == 1.0 for l in label_names)
        df = df[reduce(lambda x, acc: x | acc, criteria)]
        train.append(df)

if not isfile(test_file):
    for csv in test_csvs:
        df2, fs2, ls2 = input_old.load_csv(
            join(test_dir, csv), filter_no_labels=False, only_slice=False)
        if df2 is None:
            continue
        if df2.shape[0] == 0:
            continue
        criteria = (df2[l] == 1.0 for l in label_names)
        df2 = df2[reduce(lambda x, acc: x | acc, criteria)]
        df2['SOURCE_FILE'] = csv
        test.append(df2)

if isfile(train_file):
    train = pd.read_csv(train_file)
    print(train.shape)
elif model != 'popular' and model != 'random':
    train = pd.concat(train)
    train.to_dense().to_csv(train_file, index=False, encoding='utf-8')
    print(train.shape)

if isfile(test_file):
    test = pd.read_csv(test_file)
else:
    test = pd.concat(test)
    test.to_dense().to_csv(test_file, index=True, encoding='utf-8')
print(test.shape)

print("Clusters =", num_of_cls)

# The segment below is supposed to balance each class
# by adding multiple random samples from the training datset
if model != 'popular' and model != 'random':
    classes = list(train.groupby(label_names))
    classes_test = list(test.groupby(label_names))
    print(len(classes), len(classes_test))
    not_appear = [sum(x) for x in zip(*[y[0] for y in classes])]
    print([i + 1 for i, x in enumerate(not_appear) if x < 0.5])
    not_appear = [sum(x) for x in zip(*[y[0] for y in classes_test])]
    print([i + 1 for i, x in enumerate(not_appear) if x < 0.5])
    max_samples = max(len(c) for _, c in classes)
    num_of_samples = int(8 * train.shape[0] / len(classes)) if len(classes) * max_samples > 8 * train.shape[0] else max_samples
    train = sklearn.utils.shuffle(pd.concat(c.sample(num_of_samples, replace=True) for _, c in classes), random_state=prng)

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

if model != 'popular' and model != 'random':
    train_samps = train.loc[:, 'F-Expr-Size':]
    print(train_samps.shape)
    train_labels = train.loc[:, 'L-Cluster1':last_L]
    # train_labels = categorize(train_labels)

test_samps = test.loc[:, 'F-Expr-Size':]
del test_samps['SOURCE_FILE']
print(test_samps.shape)
test_labels = test.loc[:, 'L-Cluster1':last_L]
# test_labels = categorize(test_labels)
test_span = test.loc[:, 'SourceSpan']
test_file = test.loc[:, 'SOURCE_FILE']

clf = Model()

if model == 'dnn' or model == 'load':
    clf_input = Input(shape=(train_samps.shape[1],))
    # clf_input = Input(shape=(128,))
    x = Dense(512, activation='relu')(clf_input)
    # x = Dropout(0.5)(x)
    x = Dense(512, activation='relu')(x)
    x = Dense(512, activation='relu')(x)
    x = Dense(num_of_cls, activation='softmax')(x)

    clf = Model(clf_input, x)
    clf.summary()
    clf.compile(optimizer='adam', loss='categorical_crossentropy', metrics=['accuracy'])
elif model == 'cnn' or model == 'load-cnn':
    clf_input = Input(shape=(train_samps.shape[1], 1, 1))
    x = Conv2D(64, (6, 1), activation='relu', padding='same')(clf_input)
    x = Conv2D(64, (6, 1), activation='relu', padding='same')(x)
    x = MaxPooling2D((2, 1), strides=(2, 1))(x)

    x = Conv2D(64, (16, 1), activation='relu', padding='same')(x)
    x = Conv2D(64, (16, 1), activation='relu', padding='same')(x)
    x = MaxPooling2D((2, 1), strides=(2, 1))(x)

    x = Flatten()(x)
    x = Dense(1024, activation='relu')(x)
    x = Dense(1024, activation='relu')(x)
    x = Dense(512, activation='relu')(x)
    x = Dense(num_of_cls, activation='softmax')(x)

    clf = Model(clf_input, x)
    clf.summary()
    clf.compile(optimizer='adam', loss='categorical_crossentropy', metrics=['accuracy'])
elif model == 'svm':
    clf = SVC(C=2, gamma='auto', cache_size=600, probability=True, random_state=prng)

#Standarize the data
# scaler = StandardScaler()
# pca = PCA(n_components=64)
# nmf = NMF(n_components=128, random_state=prng)
train_stds = []
if model != 'popular' and model != 'random':
    train_stds = train_samps.values
    # train_stds = scaler.fit_transform(train_samps.values)
    # train_stds = pca.fit_transform(train_stds)
    # train_stds = nmf.fit_transform(train_stds)
    if model == 'cnn' or model == 'load-cnn':
        train_stds = train_stds.reshape(train_stds.shape[0], train_stds.shape[1], 1, 1)
    # enc = OneHotEncoder(handle_unknown='ignore')
    # ready_train_labels = enc.fit_transform(train_labels.values.reshape(-1, 1))
    ready_train_labels = train_labels.values
# ready_test_labels = enc.transform(test_labels.values.reshape(-1, 1))
ready_test_labels = test_labels.values

# Type of model training to use
clf_type = 'multiclass'

if model == 'dnn' or model == 'cnn':
    es = EarlyStopping(monitor='val_loss', mode='min', verbose=1, patience=5)
    clf.fit(train_stds, ready_train_labels, batch_size=256, epochs=200, verbose=1, validation_split=0.1, callbacks=[es])
    clf.save_weights(join('models', model + '-' + str(num_of_cls) + '-' + clf_type + '_final.h5'))
elif model == 'load' or model == 'load-cnn':
    clf.load_weights(model_file)
elif model != 'popular' and model != 'random':
    clf = clf.fit(train_stds, categorize(train_labels).values)

test_stds = test_samps.values
if model != 'popular' and model != 'random':
    test_stds = test_samps.values
    # test_stds = scaler.transform(test_samps.values)
    # test_stds = pca.transform(test_stds)
    # test_stds = nmf.transform(test_stds)
if model == 'cnn' or model == 'load-cnn':
    test_stds = test_stds.reshape(test_stds.shape[0], test_stds.shape[1], 1, 1)
if model == 'dnn' or model == 'cnn' or model == 'load' or model == 'load-cnn':
    test_loss, test_acc = clf.evaluate(test_stds, ready_test_labels)
    print("Test loss =", test_loss, ", acc =", test_acc * 100)


prob_error = []
anses = []
if model == 'popular':
    prob_error = [[0, 1, 2, 3, 4, 5, 6] for _ in range(test_stds.shape[0])]
    anses = [1 for _ in range(test_stds.shape[0])]
elif model == 'random':
    prob_error = [np.random.permutation(num_of_cls) for _ in range(test_stds.shape[0])]
    anses = [x[0] + 1 for x in prob_error]
elif model == 'svm':
    anses = clf.predict(test_stds).tolist()
    prob_score = clf.predict_proba(test_stds)
    prob_error = [np.argsort(pe)[::-1].tolist() for pe in prob_score]
else:
    prob_score = clf.predict(test_stds)
    anses = [np.argmax(pe) + 1 for pe in prob_score]
    # print(len(prob_score))
    # print(len(prob_score[0]))
    prob_error = [np.argsort(pe)[::-1].tolist() for pe in prob_score]
    # print(len(prob_error))
    # print(len(prob_error[0]))

pes_top5 = [[x + 1 for x in pe[:5]] for pe in prob_error]
pes1, pes2, pes3, pes4, pes5 = map(list, zip(*pes_top5))
ll = list(zip(test_span, pes1, pes2, pes3, pes4, pes5, categorize(test_labels).values))

# Show confusion matrix...
cm = confusion_matrix(categorize(test_labels).values, pes1)
cm = cm.astype('float') / cm.sum(axis=1)[:, np.newaxis]

lbls = ['Tmpl-' + str(i) for i in range(1, num_of_cls + 1)]

fig, ax = plt.subplots()
im = ax.imshow(cm, interpolation='nearest', cmap=plt.cm.Blues)
ax.figure.colorbar(im, ax=ax)
ax.set(xticks=np.arange(cm.shape[1]),
       yticks=np.arange(cm.shape[0]),
       xticklabels=lbls, yticklabels=lbls,
       title='Normalized confusion matrix for templates',
       ylabel='True label',
       xlabel='Predicted label')

plt.setp(ax.get_xticklabels(), rotation=45, ha="right",
         rotation_mode="anchor")

plt.show()
# ... until here

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

    if model != 'load' and model != 'load-cnn' and model != 'popular' and model != 'random':
        filenm = test_file.loc[[labelind]].values[0].split('.')
        res_dir = join(test_dir, model + '-' + str(num_of_cls) + '-' + clf_type)
        if not exists(res_dir):
            mkdir(res_dir)
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
for i, idx in enumerate(categorize(test_labels).values):
    real_tots += 1
    pes = pes_top5[i]
    # print(pes)
    # print(idx)
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
        # pes.remove(0)
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

if pes1 != anses:
    print('NOT OK: Check anses/pes difference for possible error!')
