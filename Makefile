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

define PREDICTIONS
python learning/learn.py \
  --data data/$(4)/$(1) \
  --learn_rate=$(LEARN_RATE) \
  --model=$(2) \
  --hidden_layers=$(3) \
  --batch_size=$(BATCH_SIZE) \
  --n_batches=$(BATCHES) \
  --test_data data/$(5)/$(1) \
  --store_predictions
endef

define linear_template
.PHONY: $(1)-linear
$(1)-linear:
	+$(call PREDICTIONS,$(1),linear,0,sp14,fa15)
	+$(call PREDICTIONS,$(1),linear,0,fa15,sp14)
ALL_LINEAR += $(1)-linear
endef

define hidden_template
.PHONY: $(1)-hidden-$(2)
$(1)-hidden-$(2):
	+$(call PREDICTIONS,$(1),hidden,$(2),sp14,fa15)
	+$(call PREDICTIONS,$(1),hidden,$(2),fa15,sp14)
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

