# NATE

## Getting Started

This project uses Haskell for feature extraction and Python for
learning/executing the models.

We recommend building the Haskell components using the [stack] tool.

[stack]: https://docs.haskellstack.org/en/stable/README/

``` shellsession
$ stack build
```

For python we recommend using [virtualenv].

[virtualenv]: https://virtualenv.pypa.io/en/stable/

``` shellsession
$ virtualenv .venv
$ source .venv/bin/activate
$ pip install -r requirements.txt
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
$ stack exec -- generate-features \
    --source features/data/ucsd/data/derived/sp14/pairs.json \
    --features op \
    --out data/sp14
$ stack exec -- generate-features \
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
$ python learning/learn.py \
    --data=data/sp14/op --test_data=data/fa15/op \
    --model=linear --learn_rate=0.01 --reg_rate=0.01 \
    --batch_size=200 --n_epochs=10 --seed=0
training complete in 8.24 seconds
final accuracy: 0.507 / 0.679 / 0.803
avg/std recall: 0.559 / 0.389
avg / std / med samples: 10.50 / 6.99 / 9.00
avg / std / med changes: 2.74 / 2.34 / 2.00
avg prediction time: 0.115615
testing complete in 278.65 seconds
```

And for good measure let's try a random forest too.

``` shellsession
$ python learning/trees.py decision-tree data/sp14/op data/fa15/op
(40938, 49)
(40938, 46)
precision for top 3
top 1
0.534038054968
top 2
0.70866807611
top 3
0.783509513742
recall for top 3
0.416306361952
```


## Reproducing the evaluation

Running the entire evaluation can take quite a while (i.e. hours) since
there are so many different combinations of feature sets and models to
train and evaluate. Where possible, we provide commands to run both the
full evaluation and a smaller subset, which may be particularly useful
if you're using our VM.

### Generating all feature sets

We examine many different combinations of feature sets in our evaluation,
so let's go a head and generate them all.

This will take a while depending on how many cores you have, so you might
want to go grab a cup of coffee.

``` shellsession
$ make -j20 csvs
# FASTER: just the syntax and typing features
$ make -j2 op+context+type-sp14-csvs op+context+type-fa15-csvs 
```

### Comparing Blame Accuracy (Sec. 4.2)

The first experiment compares the accuracy of our learned models against
OCaml and the state-of-the-art SHErrLoc and Mycroft tools.

Let's first train all of NATE's various models. This will also take a
while, so if you're in a hurry or on a low-powered machine try the
FASTER command.

``` shellsession
$ make -j5 linear tree hidden
# FASTER: just the MLP-500
$ make -j2 sp14-hidden-500 fa15-hidden-500
```

Running `make -j` will garble the results printed to stdout, but we also
store each model's predictions for offline analysis. The predictions are
stored in `data/{sp14,fa15}/<features>/<model>/<program>.ml.out`, with a
single predicted blame span per line. For example, to see the
predictions of the MLP-500 on the op+context+type features from the sp14
dataset, we would look at the files in
`data/sp14/op+context+type/hidden-500`.

We can compute the top-k accuracy summaries with the `results` target.

``` shellsession
$ make -j5 results
# FASTER: just the MLP-500
$ make sp14-hidden-500-results fa15-hidden-500-results
```

This will produce a `results.csv` file in the same directory as the
`<program>.ml.out` files. For example, here are the results for the
MLP-500 on the op+context+type features.

``` shellsession
$ cat data/sp14/op+context+type/hidden-500/results.csv
tool,year,features,model,top-1,top-2,top-3,recall,total
op+context+type/hidden-500,sp14,op+context+type,hidden-500,0.725,0.861,0.912,0.714,2710
$ cat data/fa15/op+context+type/hidden-500/results.csv
tool,year,features,model,top-1,top-2,top-3,recall,total
op+context+type/hidden-500,fa15,op+context+type,hidden-500,0.718,0.858,0.911,0.701,2393
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
$ cd eval/ocaml
$ ./configure -prefix $(pwd)/../build
$ make world world.opt
# NOTE: at the moment, ocaml's `make install` seems to 
# get stuck in an infinite recursion, just hit Ctrl-C
# after a few seconds and it should be fine.. Sorry!
$ make install
```

##### Building Sherrloc

``` shellsession
# first we have to build sherrloc's version of easyocaml
$ cd eval/sherrloc/easyocaml++
$ ./configure -prefix $(pwd)../../build/eocaml
$ ./build/smallworld.sh
$ ./build/install.sh
# now we can build sherrloc itself
$ cd ..
$ ant
```



Once you have built the tools, we provide another `make` target to
gather the predictions. Note that SHErrLoc in particular is quite slow
on some programs, so you may want to use our cached predictions instead
of reproducing them yourself.

``` shellsession
$ make -j6 ocaml sherrloc # mycroft
# FASTER: just ocaml
$ make -j2 ocaml
# EVEN FASTER: use our cached predictions
```

The predictions are stored as above, in
`data/{sp14,fa15}/<tool>/<program>.ml.out` files. As before, we provide
a `make` target to compute the accuracy summaries.

``` shellsession
$ make -j6 ocaml-results sherrloc-results # mycroft-results
# FASTER: just ocaml
$ make ocaml-sp14-results ocaml-fa15-results
# EVEN FASTER: use the cached results
```

As before, you should now see `results.csv` files.

``` shellsession
$ cat data/sp14/ocaml/results.csv
tool,year,features,model,top-1,top-2,top-3,recall,total
ocaml,sp14,.,ocaml,0.449,0.449,0.449,0.228,2649
$ cat data/fa15/ocaml/results.csv
tool,year,features,model,top-1,top-2,top-3,recall,total
ocaml,fa15,.,ocaml,0.433,0.433,0.433,0.221,2353
```

The actual bar graphs in the paper are produced by LaTeX, to rebuild
them after running the benchmarks:

``` shellsession
$ cd paper/oopsla17-submission && latexmk -pdf main
```


### Comparing Feature Utility (Sec. 4.3)

Next, let's see how to reproduce the feature utility results.

This will take quite a while as there are many combinations of feature
sets and models to test, and each combination does a 10-fold
cross-validation.

``` shellsession
$ make feature-cross  # this will take a few hours
# FASTER: just run the MLP-500 on the op+context+type features
$ python learning/learn.py \
    --data data/fa15/op+context+type:data/sp14/op+context+type \
    --model=hidden-500 \
    --learn_rate=0.001 --reg_rate=0.001 \
    --batch_size=200 --n_epochs=20 --n_folds=10 \
    --seed 0
```

There's no interleaving of output here, so you can scroll through the log
if you like, or you can look at the summary csvs we produce in
`models/<model>-<features>.cross.csv`. For example, to see the results
for the MLP-500 on the op+context+type feature set:

``` shellsession
$ cat models/hidden-500-op+context+type.cross.csv
model,features,top-1,top-2,top-3,recall
hidden-500,op+context+type,0.769,0.879,0.920,0.716
```

As before, the bar graphs in the paper are produced directly by LaTeX.


### Explaining Predictions (Sec. 4.4)

TODO


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
$ stack exec -- generate-features \
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
$ python learning/learn.py \
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
$ stack build && stack exec -- generate-features \
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
$ python learning/learn.py \
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
based on our experiments, you will probably want to preprocess each CSV
file to discard expressions where `F-InSlice` is false
(i.e. 0). Finally, there are an arbitrary number of `F-Feature` columns
for the input features to the model.

### Other analyses on the interaction traces

If you just want to work with the interaction traces we collected from the
students, you can find the full (anonymized) dataset at https://github.com/ucsd-progsys/yunounderstand-data.
