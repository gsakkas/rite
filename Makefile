TRAIN  ?= sp14
TEST   ?= fa15
DATA   ?= op+type+size
MODEL  ?= hidden
LAYERS ?= 500

LEARN_RATE ?= 0.001
REG_RATE   ?= 0.001
#REG_LIN_RATE ?= 0.01
BATCH_SIZE ?= 200
EPOCHS     ?= 20
SEED       ?= 0

DATAS  = op+context+type+size op+context-has+type+size op+context-count+type+size op+type+size
#DATAS  = op+context+type+size op+context-count+type+size
#DATAS += op+type+size op-cons+context+type+size op-cons+type+size
# DATAS = op+type+size
HIDDEN = 10 25 50 100 250 500

define HIDDEN_PREDICTIONS
python learning/learn.py \
  --data data/$(3)/$(1) \
  --learn_rate=$(LEARN_RATE) \
  --reg_rate=$(REG_RATE) \
  --model=hidden \
  --hidden_layers=$(2) \
  --batch_size=$(BATCH_SIZE) \
  --n_epochs=$(EPOCHS) \
  --test_data data/$(4)/$(1) \
  --seed $(SEED) \
  --store_predictions
endef

define LINEAR_PREDICTIONS
python learning/learn.py \
  --data data/$(2)/$(1) \
  --learn_rate=$(LEARN_RATE) \
  --reg_rate=$(REG_RATE) \
  --model=linear \
  --batch_size=$(BATCH_SIZE) \
  --n_epochs=$(EPOCHS) \
  --test_data data/$(3)/$(1) \
  --seed $(SEED) \
  --store_predictions
endef

define TREE_PREDICTIONS
python learning/trees.py $(1) data/$(3)/$(2) data/$(4)/$(2)
endef

define linear_template
.PHONY: $(1)-linear
$(1)-linear:
	+$(call LINEAR_PREDICTIONS,$(1),sp14,fa15)
	+$(call LINEAR_PREDICTIONS,$(1),fa15,sp14)
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
	+$(call HIDDEN_PREDICTIONS,$(1),$(2),sp14,fa15)
	+$(call HIDDEN_PREDICTIONS,$(1),$(2),fa15,sp14)
ALL_HIDDEN += $(1)-hidden-$(2)

$(1)-hidden-$(2)-results:
	+stack exec evaluate -- evaluate $(1)/hidden-$(2) data/sp14
	+stack exec evaluate -- evaluate $(1)/hidden-$(2) data/fa15
ALL_HIDDEN_RESULTS += $(1)-hidden-$(2)-results
endef

define csv_template
.PHONY: $(1)-$(2)-csvs
$(1)-$(2)-csvs:
	+stack exec generate-features -- $(1) $(2)
ALL_CSVS += $(1)-$(2)-csvs
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

$(foreach data,$(DATAS),\
 $(eval $(call csv_template,sp14,$(data))))

$(foreach data,$(DATAS),\
 $(eval $(call csv_template,fa15,$(data))))


.PHONY: all
all: linear tree hidden

.PHONY: csvs
csvs: $(ALL_CSVS)

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
