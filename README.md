# RITE

## Getting Started

Let's quickly walk through setting up a development environment.

If you don't mind using a VM and things being a bit slower, we've
[provided] one for you, the user and password are both "rite". The VM
should already have everything you need installed, and will boot with a
terminal open in the repository. You just need to activate the python
virtualenv with

``` shellsession
~/rite $ source .venv/bin/activate
```

and then you should be able to skip to "Reproducing the evaluation
(Step-by-Step Instructions)".

[provided]: https://www.dropbox.com/s/b8a7nfwi8loiwvp/nate-artifact.ova?dl=0

### Getting the source

Make sure you clone with `--recursive` as we have a few submodules.

``` shellsession
~ $ git clone --recursive https://github.com/gsakkas/rite.git
~ $ cd rite
```

### Building

This project uses Haskell for feature extraction and Python (3.8) for
learning/executing the models.

There are also some required libraries and tools that won't be installed
automatically. If you're on Ubuntu, the following command should suffice.

``` shellsession
$ sudo apt install haskell-stack python3-pip libtinfo-dev libopenblas-dev python3-tk dvipng
```

We recommend building the Haskell components using the [stack] tool.

[stack]: https://docs.haskellstack.org/en/stable/README/

``` shellsession
~/rite $ stack setup && stack build
```
If the above command fails to build RITE, then try installing the most recent
version of stack with:

``` shellsession
~ $ curl -sSL https://get.haskellstack.org/ | sh -s - -f
```

For python we recommend using [virtualenv].

[virtualenv]: https://virtualenv.pypa.io/en/stable/

``` shellsession
~/rite $ virtualenv .venv
~/rite $ source .venv/bin/activate
~/rite $ pip3 install -r requirements.txt
```

### Testing

Let's run a quick test to make sure everything was built/installed
correctly. We'll train a deep neural network using only a subset of our
features.

First, we'll extract the features from the paired programs and find all fix
templates (clusters). This should take around half an hour. You'll also see
a bunch of warnings about unbound variables (in particular for variants of
`printf` which we don't yet support), this is expected. OCaml interleaves name
resolution and type checking, so it will sometimes abort with a type error
before discovering an unbound variable.

``` shellsession
~/rite $ stack exec -- generate-features \
            --features clusters+some \
            --source features/data/ucsd/data/derived/sp14/pairs.json \
            --out data/sp14_min
Number of clusters = 146
~/rite $ stack exec -- generate-features \
            --features known+clusters+some \
            --source features/data/ucsd/data/derived/fa15/pairs.json \
            --out data/fa15_min \
            --clusters data/sp14_min/clusters/top_clusters.json
Number of clusters = 118
```
The command line output should include the lines with `Number of lines = `
near the end. Those are the total number of fix template clusters extracted
from each year.

The result will be a set of `.ml` files in the `data/{sp14_min,fa15_min}`
directories, containing the individual programs, a set of `.csv`
files in the `data/sp14_min/clusters+some` and
`data/fa15_min/known+clusters+some` directories, containing the extracted
features for each program, and a set of `.ml` files in the
`data/{sp14_min,fa15_min}/clusters` containing the fix template clusters.
We are not going to use the clusters in the `data/fa15_min` directory.

Next, let's train a deep neural network (DNN) on the sp14 programs and test it
on the fa15 programs. The specific learning parameters don't particularly
matter here and are predefined in the script.

``` shellsession
~/rite $ python3 learning/predict_fixes_dnn.py \
            small \
            data/sp14_min/clusters+some/ \
            data/fa15_min/known+clusters+some/
Clusters = 50
accuracy for top 6
top 1
41.98800342759212
top 3
66.53813196229649
top 5
76.13538988860326
top 6
78.83461868037703
accuracy for top 3 locations
77.41312741312741
accuracy for top 5 locations
87.95366795366796
```

The output will contain a lot more information, mainly for the training of the
DNN, but the above lines contain the important information, i.e. the fix
template prediction accuracy and the error localization accuracy.

Finally, we will repair a program using the appropriate predictions.

``` shellsession
~/rite $ stack exec -- make-fixes \
            --source features/data/ucsd/data/derived/fa15/pairs.json \
            --mode tiny \
            --predictions data/fa15_min/known+clusters+some/small-50-multiclass \
            --clusters data/sp14_min/clusters \
            --out data/fa15_min/repaired/rite \
            --file 42
42
True
Just ((100.0,0.0),[(Nothing,120)])
```

The command line argument `--file ID` can get as a value, any number `ID` that
represents the ID of a `.ml` program from the directory `data/fa15_min`. The
first output line will contain that ID, the second will return `True` if the
program repair was successful and the third will contain some statistical
information for other use.

The final repaired solutions for the program `ID.ml` will be in a new `.ml` file
in the directory that we passed with the `--out` argument, i.e.
`data/fa15_min/repaired/rite`, with same `ID.ml` filename. This file will contain
up to 3 top ranked solutions, i.e. repairs for the ill-typed `ID.ml` program.

If the above command fails with:

``` shellsession
make-fixes: ./data/fa15_min/known+clusters+some/small-50-multiclass/1544.csv: openBinaryFile: resource exhausted (Too many open files)
```

then try:

``` shellsession
~/rite $ ulimit -n 524288
```

## Reproducing the evaluation (Step-by-Step Instructions)

Running the entire evaluation can take quite a while (i.e. 24 hours) since
there are so many computation-heavy steps we have to follow. Where possible,
we provide commands to run both the full evaluation and a smaller subset,
which may be particularly useful if you're using our VM.

### Generating all feature sets and clusters

First, we'll extract the features from the paired programs and find all fix
templates (clusters). This should take around an hour.

``` shellsession
~/rite $ stack exec -- generate-features \
            --features clusters+all \
            --source features/data/ucsd/data/derived/sp14/pairs.json \
            --out data/sp14
Number of clusters = 146
~/rite $ stack exec -- generate-features \
            --features known+clusters+all \
            --source features/data/ucsd/data/derived/fa15/pairs.json \
            --out data/fa15 \
            --clusters data/sp14/clusters/top_clusters.json
Number of clusters = 118
```
The command line output should include the lines with `Number of lines = `
near the end. Those are the total number of fix template clusters extracted
from each year.

The result will be a set of `.ml` files in the `data/{sp14,fa15}` directories,
containing the individual programs, a set of `.csv` files in the
`data/sp14/clusters+all` and`data/fa15/known+clusters+all` directories,
containing the extracted features for each program, and a set of `.ml` files
in the `data/{sp14,fa15}/clusters` containing the fix template clusters.
We are not going to use the clusters in the `data/fa15` directory.

We are also providing all these extracted files, if you want to skip this step.

### Accuracy (Sec. 6.1)

The first experiment compares the accuracy of our learned models against
a random and a popular classifier.

Let's first train all of RITE's various models. This will take a while
depending on how many cores you have, so you might want to go grab a cup
of coffee.

``` shellsession
~/rite $ python3 learning/predict_fixes_dnn.py \
            dnn \
            data/sp14/clusters+all/ \
            data/fa15/known+clusters+all
Clusters = 50
Test ALL loss = 0.6660116819735946 , acc = 88.53344917297363
Test loss = 3.506852368973419 , acc = 43.78748834133148
accuracy for top 6
top 1
43.78748928877464
top 3
68.68037703513282
top 5
77.9777206512425
top 6
80.719794344473
accuracy for top 3 locations
78.8030888030888
accuracy for top 5 locations
88.4942084942085
```

Similarly, we can get the results for the other two classifiers with:

``` shellsession
~/rite $ python3 learning/predict_fixes_dnn.py \
            random \
            data/sp14/clusters+all/ \
            data/fa15/known+clusters+all
~/rite $ python3 learning/predict_fixes_dnn.py \
            popular \
            data/sp14/clusters+all/ \
            data/fa15/known+clusters+all
```

The results are not expected to be exactly the same as presented in the paper,
but they should be very close. You can reproduce our results for the DNN
classifier by loading a pretrained model that we provide with:

``` shellsession
~/rite $ python learning/predict_fixes_dnn.py \
            load \
            data/sp14/clusters+all/ \
            data/fa15/known+clusters+all \
            models/dnn-50-multiclass-final.h5
```

Finally, we can reproduce the confusion matrix of the top 30 fix templates with:

``` shellsession
~/rite $ python3 learning/plot_conf_matrix_30.py \
            load \
            data/sp14/clusters+all/ \
            data/fa15/known+clusters+all/ \
            models/dnn-30-multiclass-final.h5
```

### Efficiency (Sec. 6.2)

Next, let's see how to reproduce the program repair rates.

This will take quite a while as there are many programs to synthesize and
each program has a synthesis timeout of 90 seconds. Running the full test
can take up to 20 hours.

``` shellsession
~/rite $ python3 run_all_synthesis.py all
```

The final repaired solutions for the programs will be in new `.ml` files
in the directories `data/fa15/repaired/{rite,naive}`. Each file will contain up
to 3 top ranked solutions, i.e. repairs for the ill-typed program.

You can skip synthesizing solutions for all the programs in the test set
(fa15) by using the provided synthesis times that we extracted. The repair
rate graph can be generated with our data or by the data from the previous
command, by using:

``` shellsession
~/rite $ python3 plot_repair_rates.py all
```

You can generate the repaired solutions for a smaller subset of programs
from the test set, e.g. the 100 first programs, by using:

``` shellsession
~/rite $ python3 run_all_synthesis.py 100
Naive:
10 sec: Repair rate = 0.61
20 sec: Repair rate = 0.75
30 sec: Repair rate = 0.79
40 sec: Repair rate = 0.83
50 sec: Repair rate = 0.86
60 sec: Repair rate = 0.87
70 sec: Repair rate = 0.87
80 sec: Repair rate = 0.89
90 sec: Repair rate = 0.92
Rite:
10 sec: Repair rate = 0.8
20 sec: Repair rate = 0.85
30 sec: Repair rate = 0.88
40 sec: Repair rate = 0.9
50 sec: Repair rate = 0.92
60 sec: Repair rate = 0.93
70 sec: Repair rate = 0.93
80 sec: Repair rate = 0.95
90 sec: Repair rate = 0.96
```

An then you can plot the repair rate graph for the data from the previous
command, by using:

``` shellsession
~/rite $ python3 plot_repair_rates.py 100
```

If you get an error running the `run_all_synthesis.py` script, because of
the argument `capture_output=True` in line **30**, then you should replace
it in **both** line **30** and line **82** with `stdout=PIPE, stderr=PIPE`
and should import `PIPE` at the top of the file with
`from subprocess import PIPE`. This could happen if you have an older
version of python.

### Usefulness & Impact of Templates on Quality (Sec. 6.3 & 6.4)

The rest of our evaluation was based on a user study and an expert study.
For both of them, we used a web interface that can be reached [here].

[here]: http://dijkstra.eecs.umich.edu/~endremad/George_HumanStudy1/index.php

We can't provide a way to run Seminal at the moment, since it requires another
VM with a much older version of Ubuntu to compile it and generate the programs.
We provide however all the generated outputs of Seminal in the
`data/{sp14_seminal,fa15_seminal}` directories, where each `ID.ml.out` file
corresponds to the `ID.ml` program from our dataset.

Furthermore, the list of program IDs used for the human studies are the following:

`42, 56, 1007, 71, 2056, 1777, 102, 108, 109, 709, 1421, 156, 174, 178, 180, 209, 269, 329, 569, 628, 651`

and the RITE solutions can be reproduced with:

``` shellsession
~/rite $ stack exec -- make-fixes \
            --source features/data/ucsd/data/derived/fa15/pairs.json \
            --mode tiny \
            --predictions data/fa15/known+clusters+all/dnn-50-multiclass \
            --clusters data/sp14/clusters \
            --out data/fa15/repaired/rite \
            --file ID
```

by replacing `ID` each time with the appropriate program ID from the list.
This step is not necessary if all programs were generated in the previous
step with:

``` shellsession
~/rite $ python3 run_all_synthesis.py all
```
