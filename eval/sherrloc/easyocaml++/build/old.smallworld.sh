#!/bin/sh
#
# Copy and pasted from fastworld.sh, boot.sh and world.byte.sh .
#
# build small parts faster with 
# $ ocamlbuild.native -ocamlc 'boot/ocamlrun boot/ocamlc' -ocamldep 'boot/ocamlrun boot/ocamldep' -ocamllex 'boot/ocamlrun boot/ocamllex' ...

TAG_LINE='true: -use_stdlib'

OCAMLBUILD_BOOT="./boot/ocamlrun boot/myocamlbuild.boot"
OCAMLBUILD="boot/ocamlrun boot/myocamlbuild"

OCAMLMKLIB_BYTE="tools/ocamlmklib.byte"
SOME_OTHERLIBS="otherlibs/str/str.cma otherlibs/dynlink/dynlink.cma otherlibs/unix/unix.cma"
SOME_OTHERLIBS_SO="otherlibs/str/dllstr.so otherlibs/unix/dllunix.so"

SOME_CAMLP4="camlp4/Camlp4/Camlp4Ast.partial.ml \
  camlp4/boot/camlp4boot.byte \
  camlp4/Camlp4.cmo \
  camlp4/camlp4lib.cma"


################################################################################
# Prepare (from fastworld.sh)
#
cd `dirname $0`
set -e
echo "------------------------ INIT & CONFIG ------------------------"
./mkconfig.sh
./mkmyocamlbuild_config.sh
. ../config/config.sh
echo "---------------------- BUILDING C PARTS -----------------------"
if [ "x$EXE" = "x.exe" ]; then
  ./boot-c-parts-windows.sh
else
  ./boot-c-parts.sh
fi
echo "--------------------------- BOOTING ---------------------------"
cd ..
set -ex
################################################################################


################################################################################
# Prepare for ocamlbuild - build stdlib (from boot.sh)
#
$OCAMLBUILD_BOOT -tag-line "$TAG_LINE" \
  boot/stdlib.cma boot/std_exit.cmo

$OCAMLBUILD_BOOT -tag-line "$TAG_LINE" $OCAMLMKLIB_BYTE
################################################################################


################################################################################
# Bootstrap ocamlbuild ... (from boot.sh)
#
$OCAMLBUILD_BOOT -tag-line "$TAG_LINE" -log _boot_log1 \
  ocamlbuild/ocamlbuildlightlib.cma ocamlbuild/ocamlbuildlight.byte

rm -f _build/myocamlbuild

$OCAMLBUILD_BOOT -just-plugin -install-lib-dir _build/ocamlbuild -byte-plugin

cp _build/myocamlbuild boot/myocamlbuild
################################################################################


################################################################################
# Additional dependencies for EasyOCaml
#
echo "-------------------- BUILDING OTHERLIBS  ----------------------"
$OCAMLBUILD -tag-line "$TAG_LINE"  $@ -log _boot_log2 \
  $OCAMLMKLIB_BYTEA $SOME_OTHERLIBS $SOME_OTHERLIBS_SO

echo "---------------------- BUILDING CAMLP4  -----------------------"
. ./build/camlp4-targets.sh

$OCAMLBUILD -tag-line "$TAG_LINE"  $@ -log _boot_log2 $SOME_CAMLP4
################################################################################


################################################################################
# Building ocaml/c
#
$OCAMLBUILD -tag-line "$TAG_LINE" \
  $@ -log _boot_log3 boot/camlheader 

echo "---------------------- BUILDING ECAMLC  -----------------------"
$OCAMLBUILD -tag-line "$TAG_LINE" \
  $@ -log _boot_log3 ecamlc

echo "----------------------  BUILDING ECAML  -----------------------"
$OCAMLBUILD -tag-line "$TAG_LINE" \
  $@ -log _boot_log3 ecaml

$OCAMLBUILD -tag-line "$TAG_LINE" \
  $@ -log _boot_log3 camlp4/camlp4o.cma

$OCAMLBUILD -tag-line "$TAG_LINE" \
  $@ -log _boot_log3 ocamlbuild/ocamlbuild.byte
################################################################################
