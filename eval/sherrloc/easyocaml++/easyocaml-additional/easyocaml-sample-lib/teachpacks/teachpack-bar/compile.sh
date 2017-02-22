#!/bin/bash

cp ../../../../../easyocaml/ezyTeachpack.cmi .

ocamlc -I ../../lang-levels/lang-foo/ -c *.ml