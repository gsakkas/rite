#!/bin/bash

set -e
set -x

if [[ "$(uname)" == "Darwin" ]]; then
    # OSX has some weird issues with their assembly tricks; need to build 32-bit
    cp configure tmp && sed "s/asppflags='-c -DSYS_/asppflags='-m32 -c -DSYS_/" <tmp >configure && rm tmp
    ./configure -prefix $HERE/$BUILDDIR/eocaml -cc "$CC -m32"
else
    ./configure -prefix $HERE/$BUILDDIR/eocaml
fi
