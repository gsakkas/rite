# NATE

## Getting Started

Let's quickly walk through setting up a development environment.

If you don't mind using a VM and things being a bit slower, we've
[provided] one for you, the user and password are both "nate". The VM
should already have everything you need installed, and will boot with a
terminal open in the repository. You just need to activate the python
virtualenv with

``` shellsession
~/nate $ source .venv/bin/activate
```

and then you should be able to skip to "Reproducing the evaluation".

[provided]: https://www.dropbox.com/s/b8a7nfwi8loiwvp/nate-artifact.ova?dl=0

### Getting the source

Make sure you clone with `--recursive` as we have a few submodules.

``` shellsession
~ $ git clone --recursive https://github.com/ucsd-progsys/nate.git
~ $ cd nate
```

### Building

This project uses Haskell for feature extraction and Python (2.7) for
learning/executing the models.

There are also some required libraries and tools that won't be installed
automatically: ncurses, graphviz, BLAS, Tk, and Java/Ant (if you want to
run the SHErrLoc comparison). If you're on Ubuntu, the following command
should suffice.

``` shellsession
$ sudo apt-get install ncurses-dev graphviz libopenblas-dev python-tk openjdk-8-jdk ant
```

We recommend building the Haskell components using the [stack] tool.

[stack]: https://docs.haskellstack.org/en/stable/README/

``` shellsession
~/nate $ stack setup && stack build
```

For python we recommend using [virtualenv].

[virtualenv]: https://virtualenv.pypa.io/en/stable/

``` shellsession
~/nate $ virtualenv .venv
~/nate $ source .venv/bin/activate
~/nate $ pip install -r requirements.txt
```

### Testing

Let's run a quick test to make sure everything was built/installed
correctly. We'll train a logistic regression on just the local syntactic
features.

First, we'll extract the features from the paired programs. This should
take a few minutes. You'll also see a bunch of warnings about unbound
variables (in particular for variants of `printf` which we don't yet
support), this is expected. OCaml interleaves name resolution and type
checking, so it will sometimes abort with a type error before discovering
an unbound variable.

``` shellsession
~/nate $ stack exec -- generate-features \
           --source features/data/ucsd/data/derived/sp14/pairs.json \
           --features op \
           --out data/sp14
~/nate $ stack exec -- generate-features \
           --source features/data/ucsd/data/derived/fa15/pairs.json \
           --features op \
           --out data/fa15
```

The result will be a set of `.ml` files in the `data/{sp14,fa15}`
directories, containing the individual programs, and a set of `.csv`
files in the `data/{sp14,fa15}/op` directories, containing the extracted
features for each program.

Next, let's train a logistic regression on the sp14 programs and test it
on the fa15 programs. The specific learning parameters don't particularly
matter here since we're just trying to make sure everything was built
properly.

``` shellsession
~/nate $ python learning/learn.py \
           --data=data/sp14/op --test_data=data/fa15/op \
           --model=linear --learn_rate=0.01 --reg_rate=0.01 \
           --batch_size=200 --n_epochs=10 --seed=0
training complete in 5.48 seconds
final accuracy: 0.492 / 0.663 / 0.782
avg/std recall: 0.532 / 0.388
avg / std / med samples: 10.50 / 6.99 / 9.00
avg / std / med changes: 2.74 / 2.34 / 2.00
avg prediction time: 0.179411
testing complete in 430.08 seconds
```

And for good measure let's try a decision tree too.

``` shellsession
~/nate $ python learning/trees.py decision-tree data/sp14/op data/fa15/op
(40938, 49)
(40938, 45)
precision for top 3
top 1
0.534460887949
top 2
0.707822410148
top 3
0.780549682875
recall for top 3
0.415379864114
```


## Reproducing the evaluation

Running the entire evaluation can take quite a while (i.e. hours) since
there are so many different combinations of feature sets and models to
train and evaluate. Where possible, we provide commands to run both the
full evaluation and a smaller subset, which may be particularly useful
if you're using our VM.

If you're running the FASTER commands and want to examine a different
feature set, here's a simple table to help select a feature set.

| Segment  | Description                                   |
| -------- | --------------------------------------------- |
| op       | baseline of local syntax (always comes first) |
| +context | add contextual syntax                         |
| +type    | add typing features (local and contextual)    |
| +size    | add expression size                           |

For example, to use the feature set with local and contextual syntax
features and expression size, we would use `op+context+size`.


### Generating all feature sets

We examine many different combinations of feature sets in our evaluation,
so let's go a head and generate them all.

This will take a while depending on how many cores you have, so you might
want to go grab a cup of coffee.

``` shellsession
~/nate $ make -j20 csvs
# FASTER: just the full feature set
~/nate $ make -j2 sp14-op+context+type+size-csvs fa15-op+context+type+size-csvs
```

### Comparing Blame Accuracy (Sec. 4.2)

The first experiment compares the accuracy of our learned models against
OCaml and the state-of-the-art SHErrLoc and Mycroft tools.

Let's first train all of NATE's various models. This will also take a
while, so if you're in a hurry or on a low-powered machine try the
FASTER command.

``` shellsession
~/nate $ make -j5 linear tree hidden
# FASTER: just the MLP-500 with the op+context+type+size features
~/nate $ make op+context+type+size-hidden-500
```

Running `make -j` will garble the results printed to stdout, but we also
store each model's predictions for offline analysis. The predictions are
stored in `data/{sp14,fa15}/<features>/<model>/<program>.ml.out`, with a
single predicted blame span per line. For example, to see the
predictions of the MLP-500 on the op+context+type features from the sp14
dataset, we would look at the files in
`data/sp14/op+context+type+size/hidden-500`.

We can compute the top-k accuracy summaries with the `results` target.

``` shellsession
~/nate $ make -j5 results
# FASTER: just the MLP-500
~/nate $ make op+context+type+size-hidden-500-results
```

This will produce a `results.csv` file in the same directory as the
`<program>.ml.out` files. For example, here are the results for the
MLP-500 on the op+context+type features.

``` shellsession
~/nate $ cat data/sp14/op+context+type+size/hidden-500/results.csv
tool,year,features,model,top-1,top-2,top-3,recall,total
op+context+type+size/hidden-500,sp14,op+context+type+size,hidden-500,0.736,0.864,0.915,0.720,2712
~/nate $ cat data/fa15/op+context+type+size/hidden-500/results.csv
tool,year,features,model,top-1,top-2,top-3,recall,total
op+context+type+size/hidden-500,fa15,op+context+type+size,hidden-500,0.701,0.841,0.907,0.696,2365
```

#### State of the Art

You may also want to compare our models against OCaml, SHErrLoc, and
Mycroft. We have patched all of these tools slightly to produce source
locations in a standard format, so you will have to build the included
versions. 

Unfortunately, Mycroft is not available publicly so we are not
comfortable distributing it ourselves. Please contact the authors for a
copy if you wish to rerun the Mycroft benchmarks.


##### Building OCaml

``` shellsession
~/nate $ cd eval/ocaml
~/nate/eval/ocaml $ ./configure -prefix $(pwd)/../build
~/nate/eval/ocaml $ make world world.opt
# NOTE: at the moment, ocaml's `make install` seems to 
# get stuck in an infinite recursion, just hit Ctrl-C
# after a few seconds and it should be fine.. Sorry!
~/nate/eval/ocaml $ make install
```

##### Building Sherrloc

``` shellsession
# first we have to build sherrloc's version of easyocaml
~/nate $ cd eval/sherrloc/easyocaml++
~/nate/eval/sherrloc/easyocaml++ $ ./configure -prefix $(pwd)/../../build/eocaml
~/nate/eval/sherrloc/easyocaml++$ ./build/smallworld.sh
~/nate/eval/sherrloc/easyocaml++$ ./build/install.sh
# now we can build sherrloc itself
~/eval/sherrloc/easyocaml++ $ cd ..
~/eval/sherrloc $ ant
```

##### Gathering state-of-the-art predictions

Once you have built the tools, we provide another `make` target to
gather the predictions. Note that SHErrLoc in particular is quite slow
on some programs, so you may want to use our cached predictions instead
of reproducing them yourself.

``` shellsession
~/nate $ make -j6 ocaml sherrloc # mycroft
# FASTER: just ocaml
~/nate $ make -j2 ocaml
# EVEN FASTER: use our cached predictions
```

NOTE: As mentioned in the paper, there are a number of programs that
SHErrLoc was unable to check due to unsupported language features or
exceeding its 1GB heap limit. These will present in the logs as errors
of the form:

```
This feature is not supported by EasyOcaml
eval/bin/ecamlc: line 14: error.con: No such file or directory

OR

OutOfMemoryError
```

The predictions are stored as above, in
`data/{sp14,fa15}/<tool>/<program>.ml.out` files. As before, we provide
a `make` target to compute the accuracy summaries.

``` shellsession
~/nate $ make -j6 ocaml-results sherrloc-results # mycroft-results
# FASTER: just ocaml
~/nate $ make ocaml-sp14-results ocaml-fa15-results
# EVEN FASTER: use the cached results
```

NOTE: As mentioned in the paper, there are a number of programs for
which SHErrLoc and OCaml either did not produce any blame locations
(perhaps due to a timeout), or our scripts could not match one of their
blame locations with program locations as we see them (basically,
off-by-one errors in comparing source spans). In these cases, you will
see warnings of the form:

```
WARN: no blamed spans

OR

WARN: blamed spans not subset of all spans
```


As before, you should now see `results.csv` files.

``` shellsession
~/nate $ cat data/sp14/ocaml/results.csv
tool,year,features,model,top-1,top-2,top-3,recall,total
ocaml,sp14,.,ocaml,0.448,0.448,0.448,0.227,2652
~/nate $ cat data/fa15/ocaml/results.csv
tool,year,features,model,top-1,top-2,top-3,recall,total
ocaml,fa15,.,ocaml,0.435,0.435,0.435,0.219,2328
```

The actual bar graphs in the paper are produced by LaTeX, to rebuild
them after running the benchmarks:

``` shellsession
~/nate $ cd paper/oopsla17-submission && latexmk -pdf main
```


### Comparing Feature Utility (Sec. 4.3)

Next, let's see how to reproduce the feature utility results.

This will take quite a while as there are many combinations of feature
sets and models to test, and each combination does a 10-fold
cross-validation.

``` shellsession
~/nate $ make feature-cross  # this will take a few hours, and requires all feature sets
# FASTER: just run the MLP-500 on the op+context+type+size features
~/nate $ python learning/learn.py \
           --data data/fa15/op+context+type+size:data/sp14/op+context+type+size \
           --model=hidden --hidden_layers=500 \
           --learn_rate=0.001 --reg_rate=0.001 \
           --batch_size=200 --n_epochs=20 --n_folds=10 \
           --seed 0
```

There's no interleaving of output here, so you can scroll through the log
if you like, or you can look at the summary csvs we produce in
`models/<model>-<features>.cross.csv`. For example, to see the results
for the MLP-500 on the op+context+type feature set:

``` shellsession
~/nate $ cat models/hidden-500-op+context+type+size.cross.csv
model,features,top-1,top-2,top-3,recall
hidden-500,op+context+type+size,0.773,0.883,0.929,0.737
```

As before, the bar graphs in the paper are produced directly by LaTeX.

### Explaining Predictions (Sec. 4.4)

In this final experiment we try to explain specific predictions from our
decision-tree classifier. We use the op+context+type feature set since
we don't expect the expression size feature to produce a very intuitive
explanation.

If you've been following the FASTER path, you may need to first extract
the op+context+type feature set and train a decision tree with:

``` shellsession
~/nate $ python learning/trees.py decision-tree data/fa15/op+context+type data/sp14/op+context+type
```


Now, we'll use the `learning/decisionpath.py` script to print out
the sequence of decisions made by the tree. When we train the
decision-tree, we also store a copy of the trained model in
`models/data-<quarter>-<features>.pkl`, so let's use the tree trained on
the fa15 data with the op+context+type features to explain the first
bogus prediction.


``` shellsession
~/nate $ python learning/decisionpath.py models/decision-tree-data-fa15-op+context+type.pkl data/sp14/op+context+type/0967.csv
# This script prints out decision paths for each expression, but we're
# only interested in the recursive call to `clone` here
...
For span
(3,42)-(3,47)
with confidence
0.369841269841
our prediction is
0.0
should be
1.0
Rules used to predict sample 2:
F-Is-Type-Fun : (= 1.0) > 0.5
F-Is-App : (= 0.0) <= 0.5
F-Is-Fun-C1 : (= 0.0) <= 0.5
F-Is-App-C1 : (= 0.0) <= 0.5
F-Is-Fun-P : (= 0.0) <= 0.5
F-Is-Type-Fun-P : (= 0.0) <= 0.5
F-Is-App-P : (= 1.0) > 0.5
F-Is-Type-Tuple-P : (= 0.0) <= 0.5
F-Is-Type-float-P : (= 0.0) <= 0.5
F-Is-Type-Tuple-C1 : (= 0.0) <= 0.5
F-Is-Type-int-P : (= 0.0) <= 0.5
F-Is-Type-expr-P : (= 0.0) <= 0.5
F-Is-Type-unit-P : (= 0.0) <= 0.5
F-Is-Type-char-P : (= 0.0) <= 0.5
F-Is-Type-bool-P : (= 0.0) <= 0.5
F-Is-Type-string-P : (= 0.0) <= 0.5
F-Is-Type-Fun-C1 : (= 0.0) <= 0.5
F-Is-Type-list-P : (= 1.0) > 0.5
leaf node 2821 reached, no decision here
...
```

There are a few important pieces of information here. First of all, we
can see that we predicted 0 (i.e. no-blame), when the correct answer was
1, and furthermore our "confidence" was 0.369. Confidence is a bit of a
misnomer here, it's really the probability that we should predict blame,
i.e. < 0.5 means we will predict no-blame, and > 0.5 means we will
predict blame.

More importantly, we see the sequence of decisions made by the tree. Each
line is as follows

``` 
<feature> : (= <feature-value>) [> <=] 0.5
```

which says that `<feature>`, with a value `<feature-value>` is greater
or less than the threshold (in our case with binary features, always
0.5). For example, the first line says that the `F-Is-Type-Fun` feature
(i.e. the type of this expression mentions the `->` type constructor) is
1 (i.e. true), which is greater than the threshold. Continuing on, we
can see that the only enabled features are `F-Is-Type-Fun`,
`F-Is-App-P` (the parent expression is an application), and
`F-Is-Type-list-P` (the type of the parent expression mentions `list`).

There should also now be a visualization of the entire tree in
`models/decision-tree-data-fa15-op+context+type.pkl.pdf`. Each node in
the tree lists a decision as above, and is shaded either blue
(indicating the classifier is leaning towards **blame**) or orange
(indicating it's leaning towards **no-blame**). Deeper shades indicate
higher confidence. When the condition of a node is true, the tree will
descend into the left child. Note that all of the conditions have the
form `<feature> <= 0.5`, so taking the left path means the feature
was disabled, the right path means the feature was enabled.


## Extending / Reusing

There are a few ways in which you may want to build on top of our work.
You might have your own dataset that you wish to evaluate NATE's models
on. Perhaps you have some clever ideas for additional features or
classifiers to use with our data. Or maybe you would like to do your own
analyses on the raw student interactions with OCaml.

### New Datasets

If you have your own dataset of ill-typed programs paired with fixes,
and you would like to see how NATE's models perform on it, it should
be fairly straightforward to integrate your data into our processing
pipeline.

First, we expect the program pairs to be in a single `pairs.json` file,
with a single JSON object on each line. Each object should have a `bad`
field with the ill-typed program, and a `fix` field with the fixed
program.

Once you have the `pairs.json` file, run

``` shellsession
~/nate $ stack exec -- generate-features \
           --source path/to/pairs.json \
           --features <features> \
           --out path/to/csvs
```

with a suitable choice of `features`, based on our experiments
`op+context+type` will probably perform best.

Then you can train and evaluate a model with your data. For example,
suppose we want to train on the combined sp14/fa15 data and evaluate on
your data, to see how well the models generalize to other
datasets. We'll use the MLP-500 classifier and op+context+type features
since they give the best results.


``` shellsession
~/nate $ python learning/learn.py \
           --data=data/sp14/op+context+type:data/fa15/op+context+type \
           --test_data=path/to/csvs \
           --model=hidden --hidden_layers=500 \
           --learn_rate=0.001 --reg_rate=0.001 \
           --batch_size=200 --n_epochs=20 \
           --seed 0
```

The `learn_rate`, `reg_rate`, `batch_size`, and `n_epochs` are learning
parameters, feel free to experiment with them, but these values seem to
work well in practice. `seed` is an optional random seed for
reproducibility.


### New features

Perhaps you have a clever idea for a new feature to improve NATE's
accuracy.

At a high level we model features as real-valued functions over typed
expressions, but things are slightly more complex in the implementation.

The feature extraction functions are defined in
`features/src/NanoML/Classify.hs`, using the type alias

``` haskell
type Feature = ([String], (TExpr -> TExpr -> [Double]))
```

That is, a `Feature` is a pair of a list of labels and a function that
takes two typed expressions and returns a list of `Double`s. The reason
we define it this way, multiple features together, is that each
expression is also given features of its parent and children, so it's
very convenient to define a feature function for the current expression,
and then use `mkContextLabels` and `mkContextFeatures` to lift it to the
surrounding context.

As an example, look at how we define the features for the syntactic
class of an expression, `preds_tis_ctx`, in terms of
`tis_op_ctx`, `tis_op`, etc.


Once you have added your new feature function, you must hook it up to
the `generate-features` binary. For this, open up
`features/bin/Generate.hs` and look at the case-analysis in the `main`
function. Here you just need to add a new case for your desired feature
set, using the `mkBadFeatures` function. For example, to create a new
feature set with local syntax and your new feature, you might add:

``` haskell
    "op+myfeature"
      -> mkBadFeatures src cls (preds_tis ++ preds_myfeature) jsons
```

Then, recompile and extract the features:

``` shellsession
~/nate $ stack build && stack exec -- generate-features \
           --source path/to/pairs.json \
           --features op+myfeature \
           --out path/to/csvs
```

### New models

Adding a new model could mean a few things. At the simple end of the
spectrum, you might want to test a different architectures for the MLP.
This requires no code changes at all, just a different setting for the
`--hidden_layers` flag. It accepts a `-` separated list of numbers,
specifying the number of hidden layers and how many units each should
have. For example, if we wanted to train an MLP with an initial hidden
layer of 250 units and a second layer of 500 units, we would call

``` shellsession
~/nate $ python learning/learn.py \
           --model=hidden --hidden_layers=250-500 # ...
```

You may also want to experiment with different settings for the learning
parameters `--learn_rate`, `--reg_rate` (for L2 regularization),
`--batch_size`, and `--n_epochs`.

If you want to make more invasive changes, e.g. different activation
functions or connections between layers, see the `build_model` function
in `learning/hidden.py`.

It's also quite straightforward to use any of scikit-learn's built-in
classifiers, just extend the switch at
https://github.com/ucsd-progsys/ml2/blob/master/learning/trees.py#L103-L119
with your choice of classifier.

Of course, you can always write your own classifier from scratch if it
doesn't fit nicely into the tensorflow or scikit-learn models. As long
as your classifier can read our CSV files and output a sequence of
ranked predictions in the one-per-line format described above (see
"Comparing Blame Accuracy"), it will fit nicely into our evaluation
pipeline. The CSV files themselves are quite simple and look roughly as
follows.

``` 
SourceSpan,L-NoChange,L-DidChange,F-InSlice,F-Feature1,F-Feature2,etc.
"(1,1)-(2,2)",0,1,1,0,0,...
"(1,5)-(1,8)",1,0,1,1,0,...
...
```

The `SourceSpan` column contains the source span for each expression,
and is what your classifier should output as predictions. The
`L-{No,Did}Change` columns are the boolean output labels, indicating
whether the expression changed in the fixed program. Having two columns
here is redundant, you can just use one of them. The `F-InSlice` column
indicates whether the expression is part of a type error
slice. Regardless of the feature set, this column will be present, and
based on our experiments, but you can safely ignore it unless you are
working with the op+slice dataset, as we usually discard expressions
where `F-InSlice` is false during feature extraction. Finally, there are
an arbitrary number of `F-Feature` columns for the input features to the
model.

### Other analyses on the interaction traces

If you just want to work with the interaction traces we collected from the
students, you can find the full (anonymized) dataset at https://github.com/ucsd-progsys/yunounderstand-data.
