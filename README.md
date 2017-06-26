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
$ stack exec -- generate-features features/data/ucsd/derived/sp14/pairs.json op
$ stack exec -- generate-features features/data/ucsd/derived/fa15/pairs.json op
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

TODO: HOW TO BUILD OCAML/SHERRLOC?

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
