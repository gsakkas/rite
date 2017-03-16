TRAIN  ?= sp14
TEST   ?= fa15
DATA   ?= op+type+size
MODEL  ?= hidden
LAYERS ?= 500

LEARN_RATE ?= 0.0003674
REG_RATE   ?= 0.9988
BATCH_SIZE ?= 170
BATCHES    ?= 10000
EPOCHS     ?= 20
SEED       ?= 12345

#DATAS  = op+context+type+size op+context-has+type+size op+context-count+type+size
#DATAS += op+type+size op-cons+context+type+size op-cons+type+size
DATAS = op+type+size
HIDDEN = 10 25 50 100 250 500

define PREDICTIONS
python learning/learn.py \
  --data data/$(4)/$(1) \
  --learn_rate=$(LEARN_RATE) \
  --reg_rate=$(REG_RATE) \
  --model=$(2) \
  --hidden_layers=$(3) \
  --batch_size=$(BATCH_SIZE) \
  --n_epochs=$(EPOCHS) \
  --test_data data/$(5)/$(1) \
  --seed $(SEED) \
  --store_predictions
endef

define TREE_PREDICTIONS
python learning/trees.py $(1) data/$(3)/$(2) data/$(4)/$(2)
endef

define linear_template
.PHONY: $(1)-linear
$(1)-linear:
	+$(call PREDICTIONS,$(1),linear,0,sp14,fa15)
	+$(call PREDICTIONS,$(1),linear,0,fa15,sp14)
ALL_LINEAR += $(1)-linear

$(1)-linear-results:
	+stack exec evaluate -- evaluate $(1)/linear data/sp14
	+stack exec evaluate -- evaluate $(1)/linear data/fa15
ALL_LINEAR_RESULTS += $(1)-linear-results
endef

define tree_template
.PHONY: $(1)-$(2)
$(1)-$(2):
	+$(call TREE_PREDICTIONS,$(2),$(1),sp14,fa15)
	+$(call TREE_PREDICTIONS,$(2),$(1),fa15,sp14)
ALL_TREE += $(1)-$(2)

$(1)-$(2)-results:
	+stack exec evaluate -- evaluate $(1)/$(2) data/sp14
	+stack exec evaluate -- evaluate $(1)/$(2) data/fa15
ALL_TREE_RESULTS += $(1)-$(2)-results
endef


define hidden_template
.PHONY: $(1)-hidden-$(2)
$(1)-hidden-$(2):
	+$(call PREDICTIONS,$(1),hidden,$(2),sp14,fa15)
	+$(call PREDICTIONS,$(1),hidden,$(2),fa15,sp14)
ALL_HIDDEN += $(1)-hidden-$(2)

$(1)-hidden-$(2)-results:
	+stack exec evaluate -- evaluate $(1)/hidden-$(2) data/sp14
	+stack exec evaluate -- evaluate $(1)/hidden-$(2) data/fa15
ALL_HIDDEN_RESULTS += $(1)-hidden-$(2)-results
endef

$(foreach data,$(DATAS),\
 $(eval $(call linear_template,$(data))))

$(foreach data,$(DATAS),\
 $(eval $(call tree_template,$(data),decision-tree)))

$(foreach data,$(DATAS),\
 $(eval $(call tree_template,$(data),random-forest)))

$(foreach data,$(DATAS),\
 $(foreach hidden,$(HIDDEN),\
  $(eval $(call hidden_template,$(data),$(hidden)))))

.PHONY: all
all: linear tree hidden

.PHONY: results
results: linear-results tree-results hidden-results

.PHONY: linear
linear: $(ALL_LINEAR)

.PHONY: linear-results
linear-results: $(ALL_LINEAR_RESULTS)

.PHONY: tree
tree: $(ALL_TREE)

.PHONY: tree-results
tree-results: $(ALL_TREE_RESULTS)

.PHONY: hidden
hidden: $(ALL_HIDDEN)

.PHONY: hidden-results
hidden-results: $(ALL_HIDDEN_RESULTS)
