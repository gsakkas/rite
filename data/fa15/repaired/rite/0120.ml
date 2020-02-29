let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | h -> [h]
    | h :: t -> [(@) ; h] :: __var_1__


(* -------------------------------------- *)

let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | h -> [h]
    | h :: t -> __fun_1__ (__fun_2__ __var_1__)


(* -------------------------------------- *)

let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | h -> [h]
    | h :: t -> [h] :: __var_1__


(* -------------------------------------- *)


(* bad

let rec listReverse l =
  match l with | [] -> [] | h -> [h] | h::t -> t @ (listReverse h);;

*)

(* student fix

let rec listReverse l =
  match l with | [] -> [] | h -> h | h::t -> t @ (listReverse [h]);;

*)

(* changed spans

(3,34)-(3,37)
h
VarG

(3,65)-(3,66)
[h]
ListG [VarG]

*)
