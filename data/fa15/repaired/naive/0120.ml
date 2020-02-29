let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | h -> [h]
    | h :: t -> listReverse l


(* -------------------------------------- *)

let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | h -> [h]
    | h :: t -> listReverse __lit__


(* -------------------------------------- *)

let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | h -> [h]
    | h :: t -> listReverse __var_1__


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
