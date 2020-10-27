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

train_orig_dir   = join(train_dir, 'bad_feats')
train_target_dir = join(train_dir, 'fix_feats')
test_orig_dir    = join(test_dir, 'bad_feats')
test_target_dir  = join(test_dir, 'fix_feats')

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

# Define number of LSTM cells
n_units = 256
if method == 'lstm' or method == 'load':
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
    model.summary()
    model.compile(optimizer='adam', loss='categorical_crossentropy', metrics=['accuracy'])
    # plot_model(model, to_file='model.png', show_shapes=True)
else:
    sys.exit(0)


def shift_targets(target):
    new_trgt = target.to_numpy()[:-1,:]
    start    = np.zeros((1, target.shape[1]), dtype=int)
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

model_path = join(train_dir, 'models')
if method == 'lstm':
    es = EarlyStopping(monitor='val_loss', mode='min', verbose=1, patience=5)
    model.fit([train_samples, train_targets], shifted_targets,
                batch_size=256,
                epochs=100,
                validation_split=0.2,
                callbacks=[es])
    if not exists(model_path):
        mkdir(model_path)
    model.save_weights(join(model_path, 'lstm-' + str(n_units) + '-full-progs.h5'))
elif method == 'load':
    model.load_weights(join(model_path, 'lstm-' + str(n_units) + '-full-progs.h5'))


# Generate target, given an encoded source sequence
def predict_sequence(encd_model, decd_model, source, n_steps, cardl):
    # Encode
    state = encd_model.predict(source)
    # Start of sequence input
    target_seq = np.zeros((1, 1, cardl))
    # Collect predictions
    output = list()
    for _ in range(n_steps):
        # Predict next node
        yhat, h, c = decd_model.predict([target_seq] + state)
        # Store prediction
        output.append(yhat[0,0,:])
        # Update state
        state = [h, c]
        # Update target sequence
        target_seq = yhat
    return np.array(output)


def predict_next_node(encd_model, decd_model, source, known_nodes, cardl):
    # Encode
    state = encd_model.predict(source)
    # Collect predictions
    output = list()
    for k_node in known_nodes:
        # Predict next node
        yhat, h, c = decd_model.predict([k_node.reshape(1, 1, cardl)] + state)
        # Store prediction
        output.append(yhat[0,0,:])
        # Update state
        state = [h, c]
    return output[-1]


def one_hot_decode(encoded_seq):
    return [np.argmax(vector) for vector in encoded_seq]


done    = 0
total   = len(test_samples)
correct = 0.0
invalid = 0
for (smpl, trgt, lbls, f) in zip(test_samples, test_targets, test_labels, test_file):
    sizes        = smpl.shape
    shaped_smpl  = smpl.to_numpy()
    first_change = np.argmax(lbls)
    if np.max(lbls) < 1.0:
        invalid += 1
        print("Function is correct already:", f)
    elif first_change == 0:
        prediction  = predict_sequence(encoder_model,
                                        decoder_model,
                                        shaped_smpl.reshape(1, sizes[0], sizes[1]),
                                        1,
                                        n_output)
        pred_node   = one_hot_decode(prediction)[0]
        target_node = one_hot_decode(trgt.to_numpy())[first_change]
        if pred_node == target_node:
            correct += 1
    elif first_change < trgt.shape[0]:
        prediction  = predict_next_node(encoder_model,
                                        decoder_model,
                                        shaped_smpl.reshape(1, sizes[0], sizes[1]),
                                        shaped_smpl[:first_change, :],
                                        n_output)
        pred_node   = np.argmax(prediction)
        target_node = one_hot_decode(trgt.to_numpy())[first_change]
        if pred_node == target_node:
            correct += 1
    else:
        invalid += 1
        print("Fixed program is smaller than buggy for:", f)
    done += 1
    print("Progress:", done, "/", total)

print("Accuracy for first changed term prediction:             ", correct * 100.0 / float(total))
print("Accuracy for first changed term prediction (only valid):", correct * 100.0 / float(total - invalid))


##############################################################################
###                        Program-level learning                          ###
##############################################################################
# Trained with:
# n_units = 256
# ...
# es = EarlyStopping(monitor='val_loss', mode='min', verbose=1, patience=5)
# model.fit([train_samples, train_targets], shifted_targets,
#             batch_size=512,
#             epochs=150,
#             validation_split=0.2,
#             callbacks=[es])
# On:
# {sp14, fa15})_lstm_1/_+some
# Got:
# Accuracy for first changed term prediction:              18.695452457510335
# Accuracy for first changed term prediction (only valid): 19.48300622307324


# Trained with:
# n_units = 512
# ...
# es = EarlyStopping(monitor='val_loss', mode='min', verbose=1, patience=5)
# model.fit([train_samples, train_targets], shifted_targets,
#             batch_size=256,
#             epochs=400,
#             validation_split=0.2,
#             callbacks=[es])
# On:
# {sp14, fa15})_lstm_1/_+some
# Got:
# Accuracy for first changed term prediction:              18.190169958658704
# Accuracy for first changed term prediction (only valid): 18.956438487314504


##############################################################################
###                        Function-level learning                         ###
##############################################################################
# Trained with:
# n_units = 256
# ...
# es = EarlyStopping(monitor='val_loss', mode='min', verbose=1, patience=5)
# model.fit([train_samples, train_targets], shifted_targets,
#             batch_size=512,
#             epochs=100,
#             validation_split=0.2,
#             callbacks=[es])
# On:
# {sp14, fa15})_lstm_2/{bad, fix}_feats
# Got:
# Accuracy for first changed term prediction:              7.7771329077190945
# Accuracy for first changed term prediction (only valid): 18.018825638727026

# Trained with:
# n_units = 512
# ...
# es = EarlyStopping(monitor='val_loss', mode='min', verbose=1, patience=5)
# model.fit([train_samples, train_targets], shifted_targets,
#             batch_size=256,
#             epochs=150,
#             validation_split=0.2,
#             callbacks=[es])
# On:
# {sp14, fa15})_lstm_2/{bad, fix}_feats
# Got:
# Accuracy for first changed term prediction:              7.7771329077190945
# Accuracy for first changed term prediction (only valid): 18.018825638727026
