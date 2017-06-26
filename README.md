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
