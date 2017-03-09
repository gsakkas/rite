TRAIN  ?= sp14
TEST   ?= fa15
DATA   ?= op+type+size
MODEL  ?= hidden
LAYERS ?= 500

LEARN_RATE ?= 0.0001
BATCH_SIZE ?= 100
BATCHES    ?= 10000


predictions:
	python learning/learn.py \
           --data data/$(TRAIN)/$(DATA) \
           --learn_rate=$(LEARN_RATE) \
           --model=$(MODEL) \
           --hidden_layers=$(LAYERS) \
           --batch_size=$(BATCH_SIZE) \
           --n_batches=$(BATCHES) \
           --only_slice \
           --test_data data/$(TEST)/$(DATA) \
           --store_predictions
