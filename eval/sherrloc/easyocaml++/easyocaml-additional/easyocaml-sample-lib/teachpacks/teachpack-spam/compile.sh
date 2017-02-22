#!/bin/bash

cp ../../../../../_build/easyocaml/ezyTeachpack.cmi .

ocamlc -I ../../lang-levels/lang-foo/ -I ../teachpack-bar -c *.ml
