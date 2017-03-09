TRAIN  ?= sp14
TEST   ?= fa15
DATA   ?= op+type+size
MODEL  ?= hidden
LAYERS ?= 500

LEARN_RATE ?= 0.0001
BATCH_SIZE ?= 100
BATCHES    ?= 10000

DATAS  = op+context+type+size op+context-has+type+size op+context-count+type+size \
	 op+type+size
HIDDEN = 10 25 50 100 250 500

define linear_template
$(1)-linear:
	make DATA=$(1) MODEL=linear TRAIN=sp14 TEST=fa15 predictions
	make DATA=$(1) MODEL=linear TRAIN=fa15 TEST=sp14 predictions
ALL_LINEAR += $(1)-linear
endef

define hidden_template
$(1)-hidden-$(2):
	make DATA=$(1) MODEL=hidden LAYERS=$(2) TRAIN=sp14 TEST=fa15 predictions
	make DATA=$(1) MODEL=hidden LAYERS=$(2) TRAIN=fa15 TEST=sp14 predictions
ALL_HIDDEN += $(1)-hidden-$(2)
endef

$(foreach data,$(DATAS),\
 $(eval $(call linear_template,$(data))))

$(foreach data,$(DATAS),\
 $(foreach hidden,$(HIDDEN),\
  $(eval $(call hidden_template,$(data),$(hidden)))))

.PHONY: all
all: linear hidden

.PHONY: linear
linear: $(ALL_LINEAR)

.PHONY: hidden
hidden: $(ALL_HIDDEN)

.PHONY: predictions
predictions:
	python learning/learn.py \
           --data data/$(TRAIN)/$(DATA) \
           --learn_rate=$(LEARN_RATE) \
           --model=$(MODEL) \
           --hidden_layers=$(LAYERS) \
           --batch_size=$(BATCH_SIZE) \
           --n_batches=$(BATCHES) \
           --test_data data/$(TEST)/$(DATA) \
           --store_predictions
