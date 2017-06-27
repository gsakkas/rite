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

PRUNE      ?= NoPrune

DATAS = op+context+type op+context+type+size
DATAS_BENCH = op+context+type
DATAS_CROSS  = op op+slice op+context op+size op+type
DATAS_CROSS += op+context+size op+context+type op+type+size
DATAS_CROSS += op+context+type+size
#HIDDEN = 10 25 50 100 250 500
HIDDEN = 10 500

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
	+stack exec evaluate -- evaluate $(1)/linear data/sp14 $(PRUNE)
	+stack exec evaluate -- evaluate $(1)/linear data/fa15 $(PRUNE)
ALL_LINEAR_RESULTS += $(1)-linear-results
endef

define tree_template
.PHONY: $(1)-$(2)
$(1)-$(2):
	+$(call TREE_PREDICTIONS,$(2),$(1),sp14,fa15)
	+$(call TREE_PREDICTIONS,$(2),$(1),fa15,sp14)
ALL_TREE += $(1)-$(2)

$(1)-$(2)-results:
	+stack exec evaluate -- evaluate $(1)/$(2) data/sp14 $(PRUNE)
	+stack exec evaluate -- evaluate $(1)/$(2) data/fa15 $(PRUNE)
ALL_TREE_RESULTS += $(1)-$(2)-results
endef


define hidden_template
.PHONY: $(1)-hidden-$(2)
$(1)-hidden-$(2):
	+$(call HIDDEN_PREDICTIONS,$(1),$(2),sp14,fa15)
	+$(call HIDDEN_PREDICTIONS,$(1),$(2),fa15,sp14)
ALL_HIDDEN += $(1)-hidden-$(2)

$(1)-hidden-$(2)-results:
	+stack exec evaluate -- evaluate $(1)/hidden-$(2) data/sp14 $(PRUNE)
	+stack exec evaluate -- evaluate $(1)/hidden-$(2) data/fa15 $(PRUNE)
ALL_HIDDEN_RESULTS += $(1)-hidden-$(2)-results
endef

define csv_template
.PHONY: $(1)-$(2)-csvs
$(1)-$(2)-csvs:
	+stack exec generate-features -- --source=features/data/ucsd/data/derived/$(1)/pairs.json --features=$(2) --out=data/$(1)
ALL_CSVS += $(1)-$(2)-csvs
endef

define HIDDEN_CROSS
python learning/learn.py \
  --data data/fa15/$(1):data/sp14/$(1) \
  --learn_rate=$(LEARN_RATE) \
  --reg_rate=$(REG_RATE) \
  --model=hidden \
  --hidden_layers=$(2) \
  --batch_size=$(BATCH_SIZE) \
  --n_epochs=$(3) \
  --n_folds=10 \
  --seed $(SEED)
endef

define LINEAR_CROSS
python learning/learn.py \
  --data data/fa15/$(1):data/sp14/$(1) \
  --learn_rate=$(LEARN_RATE) \
  --reg_rate=$(REG_RATE) \
  --model=linear \
  --batch_size=$(BATCH_SIZE) \
  --n_epochs=$(2) \
  --n_folds=10 \
  --seed $(SEED)
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

$(foreach data,$(DATAS_CROSS),\
 $(eval $(call csv_template,sp14,$(data))))

$(foreach data,$(DATAS_CROSS),\
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

.PHONY: feature-cross
feature-cross:
	+$(call LINEAR_CROSS,op+slice,1) --no_slice
	+$(call LINEAR_CROSS,op+slice,1)
	+$(call LINEAR_CROSS,op+slice,8) --only_slice
	+$(call HIDDEN_CROSS,op+slice,500,1) --no_slice
	+$(call HIDDEN_CROSS,op+slice,500,1)
	+$(call HIDDEN_CROSS,op+slice,500,8) --only_slice
	+$(call LINEAR_CROSS,op,20)
	+$(call LINEAR_CROSS,op+context,20)
	+$(call LINEAR_CROSS,op+size,20)
	+$(call LINEAR_CROSS,op+type,20)
	+$(call LINEAR_CROSS,op+context+size,20)
	+$(call LINEAR_CROSS,op+context+type,20)
	+$(call LINEAR_CROSS,op+type+size,20)
	+$(call LINEAR_CROSS,op+context+type+size,20)
	+$(call HIDDEN_CROSS,op,500,20)
	+$(call HIDDEN_CROSS,op+context,500,20)
	+$(call HIDDEN_CROSS,op+size,500,20)
	+$(call HIDDEN_CROSS,op+type,500,20)
	+$(call HIDDEN_CROSS,op+context+size,500,20)
	+$(call HIDDEN_CROSS,op+context+type,500,20)
	+$(call HIDDEN_CROSS,op+type+size,500,20)
	+$(call HIDDEN_CROSS,op+context+type+size,500,20)

.PHONY: ocaml ocaml-sp14 ocaml-fa15
ocaml: ocaml-sp14 ocaml-fa15
ocaml-sp14:
	@stack exec -- evaluate gather Ocaml data/sp14
ocaml-fa15:
	@stack exec -- evaluate gather Ocaml data/fa15

.PHONY: mycroft mycroft-sp14 mycroft-fa15
mycroft: mycroft-sp14 mycroft-fa15
mycroft-sp14:
	@stack exec -- evaluate gather Mycroft data/sp14
mycroft-fa15:
	@stack exec -- evaluate gather Mycroft data/fa15

.PHONY: sherrloc sherrloc-sp14 sherrloc-fa15
sherrloc: sherrloc-sp14 sherrloc-fa15
sherrloc-sp14:
	@stack exec -- evaluate gather Sherrloc data/sp14
sherrloc-fa15:
	@stack exec -- evaluate gather Sherrloc data/fa15

.PHONY: ocaml-results ocaml-sp14-results ocaml-fa15-results
ocaml-results: ocaml-sp14-results ocaml-fa15-results
ocaml-sp14-results:
	@stack exec evaluate -- evaluate ocaml data/sp14 $(PRUNE)
ocaml-fa15-results:
	@stack exec evaluate -- evaluate ocaml data/fa15 $(PRUNE)

.PHONY: mycroft-results mycroft-sp14-results mycroft-fa15-results
mycroft-results: mycroft-sp14-results mycroft-fa15-results
mycroft-sp14-results:
	@stack exec evaluate -- evaluate mycroft data/sp14 $(PRUNE)
mycroft-fa15-results:
	@stack exec evaluate -- evaluate mycroft data/fa15 $(PRUNE)

.PHONY: sherrloc-results sherrloc-sp14-results sherrloc-fa15-results
sherrloc-results: sherrloc-sp14-results sherrloc-fa15-results
sherrloc-sp14-results:
	@stack exec evaluate -- evaluate sherrloc data/sp14 $(PRUNE)
sherrloc-fa15-results:
	@stack exec evaluate -- evaluate sherrloc data/fa15 $(PRUNE)
