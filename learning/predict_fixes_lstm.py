import sys
from os.path import join, dirname, exists, isfile
from os import listdir, mkdir, environ
import matplotlib.pyplot as plt
from functools import reduce
import random as rn

import numpy as np
import pandas as pd
import sklearn
from sklearn.preprocessing import StandardScaler, OneHotEncoder
from sklearn.metrics import confusion_matrix
from sklearn.decomposition import PCA, NMF
from sklearn.svm import SVC
from sklearn.tree import DecisionTreeClassifier
from keras.models import Model
from keras.layers import Dense, Conv2D, MaxPooling2D, Flatten, Input, Dropout
from keras.callbacks import EarlyStopping
import tensorflow as tf

import input_old

model = sys.argv[1]
if model not in ['lstm', 'dnn', 'small', 'cnn', 'svm', 'trees', 'load', 'load-cnn']:
    print('python predict_fixes_lstm.py [lstm|dnn|small|cnn|svm|trees|load|load-cnn] <train> <test> <load-model>')
    sys.exit(1)
train_dir  = sys.argv[2]
test_dir   = sys.argv[3]
model_file = ''
if 'load' in model:
    model_file = sys.argv[4]

# The below is necessary to get reproducible results
RANDOM_SEED = 42
environ['PYTHONHASHSEED'] = str(RANDOM_SEED)
np.random.seed(RANDOM_SEED)
tf.compat.v1.random.set_random_seed(RANDOM_SEED)
prng = np.random.RandomState(RANDOM_SEED)
rn.seed(RANDOM_SEED)

train_orig_dir   = join(train_dir, 'clusters+some')
train_target_dir = join(train_dir, 'fixes+some')
test_orig_dir    = join(test_dir, 'clusters+some')
test_target_dir  = join(test_dir, 'fixes+some')

train_orig_csvs   = sorted([f for f in listdir(train_orig_dir) if f.endswith('.csv') and not f.startswith('train')])
train_target_csvs = sorted([f for f in listdir(train_target_dir) if f.endswith('.csv') and not f.startswith('train')])
test_orig_csvs    = sorted([f for f in listdir(test_orig_dir) if f.endswith('.csv') and not f.startswith('test')])
test_target_csvs  = sorted([f for f in listdir(test_target_dir) if f.endswith('.csv') and not f.startswith('test')])

# Keep only the csvs that have a 'bad' and a 'fix' feature csv
train_csvs = [csv for csv in train_orig_csvs if csv in train_target_csvs]
test_csvs  = [csv for csv in test_orig_csvs if csv in test_target_csvs]

sklearn.utils.shuffle(train_csvs, random_state=prng)
train_data = []
test_data  = []

# Read all program files
for csv in train_csvs:
    df, fs, ls = input_old.load_csv(
        join(train_orig_dir, csv), filter_no_labels=False, only_slice=False)
    if df is None or df.shape[0] == 0:
        continue
    df2, fs2, ls2 = input_old.load_csv(
        join(train_target_dir, csv), filter_no_labels=False, only_slice=False)
    if df2 is None or df2.shape[0] == 0:
        continue
    train_data.append((csv, df, df2))

for csv in test_csvs:
    df, fs, ls = input_old.load_csv(
        join(test_orig_dir, csv), filter_no_labels=False, only_slice=False)
    if df is None or df.shape[0] == 0:
        continue
    df2, fs2, ls2 = input_old.load_csv(
        join(test_target_dir, csv), filter_no_labels=False, only_slice=False)
    if df2 is None or df2.shape[0] == 0:
        continue
    test_data.append((csv, df, df2))


train_samples, train_targets, train_labels = zip(*[(s.loc[:, 'F-Is-Eq':], t.loc[:, 'F-Is-Eq':], s.loc[:, 'L-DidChange']) for _, s, t in train_data])
test_samples,  test_targets,  test_labels  = zip(*[(s.loc[:, 'F-Is-Eq':], t.loc[:, 'F-Is-Eq':], s.loc[:, 'L-DidChange']) for _, s, t in test_data])
test_span, test_file = zip(*[(s.loc[:, 'SourceSpan'], f) for f, s, _ in test_data])

sys.exit(0) ### FIXME: Works until here

clf_all = Model()
clf = Model()

if model == 'dnn' or model == 'load' or model == 'small':
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

    y = Dense(1024, activation='relu')(clf_input)
    # y = Dropout(0.5)(y)
    y = Dense(1024, activation='relu')(y)
    y = Dense(512, activation='relu')(y)
    y = Dense(1, activation='sigmoid')(y)

    clf_all = Model(clf_input, y)
    clf_all.summary()
    clf_all.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy'])
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
    clf = SVC(kernel='poly', probability=True, random_state=prng)
elif model == 'trees':
    clf = DecisionTreeClassifier(random_state=prng)

#Standarize the data
# scaler = StandardScaler()
# pca = PCA(n_components=64)
# nmf = NMF(n_components=128, random_state=prng)
train_stds_all = []
train_stds = []
if model != 'popular' and model != 'random':
    train_stds_all = train_samples.values
    train_stds = train_samps.values
    # train_stds = scaler.fit_transform(train_samps.values)
    # train_stds = pca.fit_transform(train_stds)
    # train_stds = nmf.fit_transform(train_stds)
    if model == 'cnn' or model == 'load-cnn':
        train_stds = train_stds.reshape(train_stds.shape[0], train_stds.shape[1], 1, 1)
    # enc = OneHotEncoder(handle_unknown='ignore')
    # ready_train_labels = enc.fit_transform(train_labels.values.reshape(-1, 1))
    ready_train_labels_all = train_labels_all.values
    ready_train_labels = train_labels.values
# ready_test_labels = enc.transform(test_labels.values.reshape(-1, 1))
ready_test_labels_all = test_labels_all.values
ready_test_labels = test_labels.values

# Type of model training to use
clf_type = 'multiclass'

if model == 'dnn' or model == 'cnn' or model == 'small':
    es = EarlyStopping(monitor='val_loss', mode='min', verbose=1, patience=5)
    if model != 'small' and isfile(join('models', 'dnn-' + str(num_of_cls) + '-location-final.h5')):
        clf_all.load_weights(join('models', 'dnn-' + str(num_of_cls) + '-location-final.h5'))
    else:
        es_all = EarlyStopping(monitor='val_loss', mode='min', verbose=1, patience=10)
        clf_all.fit(train_stds_all, ready_train_labels_all, batch_size=512, epochs=200, verbose=1, validation_split=0.2, callbacks=[es_all])
        if model != 'small':
            clf_all.save_weights(join('models', 'dnn-' + str(num_of_cls) + '-location-final.h5'))
    clf.fit(train_stds, ready_train_labels, batch_size=256, epochs=200, verbose=1, validation_split=0.1, callbacks=[es])
    if model != 'small':
        clf.save_weights(join('models', model + '-' + str(num_of_cls) + '-' + clf_type + '-final.h5'))
elif model == 'load' or model == 'load-cnn':
    clf.load_weights(model_file)
    clf_all.load_weights(join('models', 'dnn-' + str(num_of_cls) + '-location-final.h5'))
    model = 'dnn'
elif model != 'popular' and model != 'random':
    clf = clf.fit(train_stds, categorize(train_labels).values)

test_stds_all = test_samps_all.values
test_stds = test_samps.values
# if model != 'popular' and model != 'random':
#     test_stds_all = test_samps_all.values
#     test_stds = test_samps.values
    # test_stds = scaler.transform(test_samps.values)
    # test_stds = pca.transform(test_stds)
    # test_stds = nmf.transform(test_stds)
if model == 'cnn' or model == 'load-cnn':
    test_stds = test_stds.reshape(test_stds.shape[0], test_stds.shape[1], 1, 1)
if model == 'dnn' or model == 'cnn' or model == 'load' or model == 'load-cnn':
    test_loss_all, test_acc_all = clf_all.evaluate(test_stds_all, ready_test_labels_all)
    test_loss, test_acc = clf.evaluate(test_stds, ready_test_labels)
    print("Test ALL loss =", test_loss_all, ", acc =", test_acc_all * 100)
    print("Test loss =", test_loss, ", acc =", test_acc * 100)


prob_error = []
anses = []
loc_conf = []
if model == 'popular':
    prob_error = [[0, 1, 2, 3, 4, 5, 6] for _ in range(test_stds_all.shape[0])]
    anses = [1 for _ in range(test_stds_all.shape[0])]
    loc_conf = [np.random.rand() * 100 for _ in range(test_stds_all.shape[0])]
elif model == 'random':
    prob_error = [np.random.permutation(num_of_cls) for _ in range(test_stds_all.shape[0])]
    anses = [x[0] + 1 for x in prob_error]
    loc_conf = [np.random.rand() * 100 for _ in range(test_stds_all.shape[0])]
elif model == 'svm' or model == 'trees':
    anses = clf.predict(test_stds_all).tolist()
    prob_score = clf.predict_proba(test_stds_all)
    prob_error = [np.argsort(pe)[::-1].tolist() for pe in prob_score]
    loc_conf = [np.random.rand() * 100 for _ in range(test_stds_all.shape[0])]
else:
    prob_score = clf.predict(test_stds_all)
    anses = [np.argmax(pe) + 1 for pe in prob_score]
    # print(len(prob_score))
    # print(len(prob_score[0]))
    prob_error = [np.argsort(pe)[::-1].tolist() for pe in prob_score]
    # print(len(prob_error))
    # print(len(prob_error[0]))
    loc_conf = [c[0] * 100.0 for c in clf_all.predict(test_stds_all)]

pes_top6 = [[x + 1 for x in pe[:6]] for pe in prob_error]
pes1, pes2, pes3, pes4, pes5, pes6 = map(list, zip(*pes_top6))
all_labels = categorize(test_data.loc[:, 'L-Cluster1':last_L])
ll = list(zip(test_span, loc_conf, pes1, pes2, pes3, pes4, pes5, pes6, all_labels.values))

# Show confusion matrix...
if num_of_cls == 30:
    all_ls, ps = tuple(map(list, zip(*[(x, y) for x, y in zip(all_labels.values, pes1) if x > 0])))
    cm = confusion_matrix(all_ls, ps)
    cm = cm.astype('float') / cm.sum(axis=1)[:, np.newaxis]

    lbls = ['Tmpl-' + str(i) for i in range(1, num_of_cls + 1)]
    # print(cm.shape[1], cm.shape[0])
    plt.rc('text', usetex=True)
    plt.rc('font', family='serif')
    fig, ax = plt.subplots()
    im = ax.imshow(cm, interpolation='nearest', cmap=plt.cm.Blues)
    ax.figure.colorbar(im, ax=ax)
    ax.set(xticks=np.arange(cm.shape[1]),
        yticks=np.arange(cm.shape[0]),
        xticklabels=lbls, yticklabels=lbls,
        title='Normalized Confusion Matrix for Templates',
        ylabel='True Label',
        xlabel='Predicted Label')

    plt.setp(ax.get_xticklabels(), rotation=45, ha="right",
            rotation_mode="anchor")

    plt.show()
# ... until here
score = pd.DataFrame(data=ll, index=all_labels.index, columns=['SourceSpan', 'Loc-Conf', 'P-1', 'P-2', 'P-3', 'P-4', 'P-5', 'P-6', 'Actual'])

all_programs = 0
c1 = 0
c3 = 0
c5 = 0
c6 = 0
c1_whole = 0
c3_whole = 0
c5_whole = 0
c6_whole = 0
all_locs = 0
locs3 = 0
locs5 = 0
alocs3 = 0
alocs5 = 0
in_top5_locs = []

for labelind in list(set(all_labels.index)):
    all_programs += 1
    temp_sc = score.loc[[labelind]]
    yay1 = 0
    yay3 = 0
    yay5 = 0
    yay6 = 0
    total = 0
    for sc in temp_sc.values:
        act = sc[8]
        if act > 0:
            total += 1
            if act in sc[2:8]:
                yay6 += 1
            if act in sc[2:7]:
                yay5 += 1
            if act in sc[2:5]:
                yay3 += 1
            if sc[2] == act:
                yay1 += 1
    if total > 0:
        c1 += float(yay1) * 100 / total
        c3 += float(yay3) * 100 / total
        c5 += float(yay5) * 100 / total
        c6 += float(yay6) * 100 / total

        c1_whole += int(yay1 / total)
        c3_whole += int(yay3 / total)
        c5_whole += int(yay5 / total)
        c6_whole += int(yay6 / total)
    else:
        c1 += 100.0
        c3 += 100.0
        c5 += 100.0
        c6 += 100.0

        c1_whole += 1.0
        c3_whole += 1.0
        c5_whole += 1.0
        c6_whole += 1.0

    locs = temp_sc.loc[:, 'Loc-Conf']
    locs = np.argsort(locs.values)[::-1].tolist()
    labels = test_labels_all.loc[[labelind]]
    all_locs += sum(labels.values)
    prog_locs = sum(labels.values)
    labels3 = labels.iloc[locs[:3]]
    labels3 = sum(labels3.values)
    locs3 += labels3 / prog_locs
    labels5 = labels.iloc[locs[:5]]
    labels5 = sum(labels5.values)
    locs5 += labels5 / prog_locs
    alocs3 += labels3
    alocs5 += labels5
    to_check = [0] * len(labels.values)
    for i in locs[:5]:
        to_check[i] = 1
    in_top5_locs.extend(to_check)

    if model != 'load' and model != 'load-cnn' and model != 'popular' and model != 'random':
        filenm = test_file.loc[[labelind]].values[0].split('.')
        res_dir = join(test_dir, model + '-' + str(num_of_cls) + '-' + clf_type)
        if not exists(res_dir):
            mkdir(res_dir)
        temp_sc.to_csv(res_dir + '/' + filenm[0] + '.csv', index=False)

assert len(in_top5_locs) == len(all_labels.values)

yay1 = 0
yay1_2 = 0
yay3 = 0
yay3_2 = 0
yay5 = 0
yay5_2 = 0
yay6 = 0
yay6_2 = 0
tots = 0
yays1 = [0] * num_of_cls
yays3 = [0] * num_of_cls
yays5 = [0] * num_of_cls
yays6 = [0] * num_of_cls
alls = [0] * num_of_cls
for i, tmpl in enumerate(all_labels.values):
    pes = pes_top6[i]
    if tmpl > 0:
        tots += 1
        alls[tmpl - 1] += 1
        if tmpl in pes[:6]:
            if in_top5_locs[i]:
                yay6_2 += 1
            yay6 += 1
            yays6[tmpl - 1] += 1
        if tmpl in pes[:5]:
            if in_top5_locs[i]:
                yay5_2 += 1
            yay5 += 1
            yays5[tmpl - 1] += 1
        if tmpl in pes[:3]:
            if in_top5_locs[i]:
                yay3_2 += 1
            yay3 += 1
            yays3[tmpl - 1] += 1
        if pes[0] == tmpl:
            if in_top5_locs[i]:
                yay1_2 += 1
            yay1 += 1
            yays1[tmpl - 1] += 1

# All template accuracies for top N template-classes
# print("accuracy for top 6 per class (" + str(num_of_cls) + ")")
# print("top 1")
# print([float(x) * 100 / y if y != 0 else 0.0 for x, y in zip(yays1, alls)])
# print("top 3")
# print([float(x) * 100 / y if y != 0 else 0.0 for x, y in zip(yays3, alls)])
# print("top 5")
# print([float(x) * 100 / y if y != 0 else 0.0 for x, y in zip(yays5, alls)])
# print("top 6")
# print([float(x) * 100 / y if y != 0 else 0.0 for x, y in zip(yays6, alls)])

# Total accuracy for all program locations together
print("accuracy for top 6")
print("top 1")
print(float(yay1) * 100 / tots)
print("top 3")
print(float(yay3) * 100 / tots)
print("top 5")
print(float(yay5) * 100 / tots)
print("top 6")
print(float(yay6) * 100 / tots)

# Total accuracy for all program locations together, with each template predictions counted
# only if it was in the top 5 error localization predictions for that location
# print("accuracy for top 6 per class (" + str(num_of_cls) + ") for best 5 locations")
# print("top 1")
# print(float(yay1_2) * 100 / tots)
# print("top 3")
# print(float(yay3_2) * 100 / tots)
# print("top 5")
# print(float(yay5_2) * 100 / tots)
# print("top 6")
# print(float(yay6_2) * 100 / tots)

# Average of each program's accuracy of template prediction
# Only for the locations that changed in the dataset (that have a correct template)
# print("accuracy for top 6 (average template acc. per program)")
# print("top 1")
# print(float(c1) / all_programs)
# print("top 3")
# print(float(c3) / all_programs)
# print("top 5")
# print(float(c5) / all_programs)
# print("top 6")
# print(float(c6) / all_programs)

# How many programs are predicted 100% correct for all their locations
# print("accuracy for top 6 (acc. per 100% correct program)")
# print("top 1")
# print(float(c1_whole) * 100 / all_programs)
# print("top 3")
# print(float(c3_whole) * 100 / all_programs)
# print("top 5")
# print(float(c5_whole) * 100 / all_programs)
# print("top 6")
# print(float(c6_whole) * 100 / all_programs)

# Error localization results
print("accuracy for top 3 locations")
# print("average acc. per program")
# print(float(locs3) * 100 / all_programs)
# print("acc for all locations")
print(float(alocs3) * 100 / all_locs)

print("accuracy for top 5 locations")
# print("average acc. per program")
# print(float(locs5) * 100 / all_programs)
# print("acc for all locations")
print(float(alocs5) * 100 / all_locs)

# if pes1 != anses:
#     print('NOT OK: Check anses/pes difference for possible error!')
