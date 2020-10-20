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
from keras.models import Model
from keras.layers import Input, Dense, LSTM
from keras.callbacks import EarlyStopping
from keras.utils.vis_utils import plot_model
import tensorflow as tf

import input_old

method = sys.argv[1]
if method not in ['lstm', 'load']:
    print('python predict_fixes_lstm.py [lstm|load] <train> <test> <load-model>')
    sys.exit(1)
train_dir  = sys.argv[2]
test_dir   = sys.argv[3]
model_file = ''
if 'load' in method:
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

# Extract all datasets
train_unzipped = zip(*[(s.loc[:, 'F-Is-Eq':],
                        t.loc[:, 'F-Is-Eq':],
                        s.loc[:, 'L-DidChange'])
                        for _, s, t in train_data])
train_samples, train_targets, train_labels = map(list, train_unzipped)

test_unzipped = zip(*[(s.loc[:, 'F-Is-Eq':],
                       t.loc[:, 'F-Is-Eq':],
                       s.loc[:, 'L-DidChange'])
                       for _, s, t in test_data])
test_samples, test_targets, test_labels = map(list, test_unzipped)
test_span, test_file = zip(*[(s.loc[:, 'SourceSpan'], f) for f, s, _ in test_data])

model          = Model()
encoder_model  = Model()
decoder_model  = Model()
n_input        = train_samples[0].shape[1]
n_output       = train_targets[0].shape[1]
max_input_len  = max(map(lambda s: s.shape[0], train_samples))
max_target_len = max(map(lambda s: s.shape[0], train_targets))

print("Input data:", (len(train_samples), max_input_len, n_input))
print("Target data:", (len(train_targets), max_target_len, n_output))

if method == 'lstm':
    # Define number of LSTM cells
    n_units = 256

	# Define training encoder
    encoder_inputs = Input(shape=(None, n_input))
    encoder        = LSTM(n_units, return_state=True)
    encoder_outputs, state_h, state_c = encoder(encoder_inputs)
    encoder_states = [state_h, state_c]

    # Define training decoder
    decoder_inputs  = Input(shape=(None, n_output))
    decoder_lstm    = LSTM(n_units, return_sequences=True, return_state=True)
    decoder_outputs, _, _ = decoder_lstm(decoder_inputs, initial_state=encoder_states)
    decoder_dense   = Dense(n_output, activation='softmax')
    decoder_outputs = decoder_dense(decoder_outputs)
    model           = Model([encoder_inputs, decoder_inputs], decoder_outputs)

    # Define inference encoder
    encoder_model = Model(encoder_inputs, encoder_states)

    # Define inference decoder
    decoder_state_input_h = Input(shape=(n_units,))
    decoder_state_input_c = Input(shape=(n_units,))
    decoder_states_inputs = [decoder_state_input_h, decoder_state_input_c]
    decoder_outputs, state_h, state_c = decoder_lstm(decoder_inputs, initial_state=decoder_states_inputs)
    decoder_states        = [state_h, state_c]
    decoder_outputs       = decoder_dense(decoder_outputs)
    decoder_model         = Model([decoder_inputs] + decoder_states_inputs, [decoder_outputs] + decoder_states)

    # Compile model
    model.compile(optimizer='adam', loss='categorical_crossentropy', metrics=['accuracy'])
    plot_model(model, to_file='model.png', show_shapes=True)
else:
    sys.exit(0)


# Generate target, given source sequence
def predict_sequence(infenc, infdec, source, n_steps, cardinality):
    # Encode
    state = infenc.predict(source)
    # Start of sequence input
    target_seq = np.array([0.0 for _ in range(cardinality)]).reshape(1, 1, cardinality)
    # Collect predictions
    output = list()
    for t in range(n_steps):
        # Predict next node
        yhat, h, c = infdec.predict([target_seq] + state)
        # Store prediction
        output.append(yhat[0,0,:])
        # Update state
        state = [h, c]
        # Update target sequence
        target_seq = yhat
    return np.array(output)


def shift_targets(trgt):
    new_trgt = trgt.to_numpy()[:-1,:]
    start    = np.zeros((1, trgt.shape[1]), dtype=int)
    return np.concatenate((start, new_trgt), axis=0)

def pad_to_length(arr, max_len):
    rs = arr.shape[0]
    new_shape = ((0, max_len - rs), (0, 0))
    return np.pad(arr, new_shape, constant_values=(0))


# Train model
shifted_targets_temp = list(map(lambda t: pad_to_length(shift_targets(t), max_target_len), train_targets))
shifted_targets      = np.stack(shifted_targets_temp, axis=0)
train_samples_temp   = list(map(lambda t: pad_to_length(t.to_numpy(), max_input_len), train_samples))
train_samples        = np.stack(train_samples_temp, axis=0)
train_targets_temp   = list(map(lambda t: pad_to_length(t.to_numpy(), max_target_len), train_targets))
train_targets        = np.stack(train_targets_temp)

model.fit([train_samples, train_targets], shifted_targets,
          batch_size=512,
          epochs=100,
          validation_split=0.2)

sys.exit(0) ### FIXME: Works until here


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

pes_top6 = [[x + 1 for x in pe[:6]] for pe in prob_error]
pes1, pes2, pes3, pes4, pes5, pes6 = map(list, zip(*pes_top6))
all_labels = categorize(test_data.loc[:, 'L-Cluster1':last_L])
ll = list(zip(test_span, loc_conf, pes1, pes2, pes3, pes4, pes5, pes6, all_labels.values))

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
