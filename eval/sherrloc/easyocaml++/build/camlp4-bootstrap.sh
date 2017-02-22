#!/bin/sh
# $Id: camlp4-bootstrap.sh,v 1.2.2.2 2007/03/26 12:55:33 pouillar Exp $
set -e
cd `dirname $0`/..

TMPTARGETS="\
  camlp4/boot/Lexer.ml"

TARGETS="\
  camlp4/Camlp4/Struct/Camlp4Ast.ml \
  camlp4/boot/Camlp4.ml \
  camlp4/boot/camlp4boot.ml"

for target in $TARGETS camlp4/boot/Camlp4Ast.ml; do
  [ -f "$target" ] && mv "$target" "$target.old"
  rm -f "_build/$target"
done

if [ -x ./boot/myocamlbuild.native ]; then
  OCAMLBUILD=./boot/myocamlbuild.native
else
  OCAMLBUILD="./boot/ocamlrun boot/myocamlbuild"
fi
$OCAMLBUILD $TMPTARGETS $TARGETS

for t in $TARGETS; do
  echo promote $t
  cp _build/$t camlp4/boot/`basename $t`
  if cmp _build/$t camlp4/boot/`basename $t`.old; then
    echo fixpoint for $t
  else
    echo $t is different, you should rebootstrap it by cleaning, building and call this script
  fi
done
