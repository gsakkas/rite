let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | t -> []
    | h :: t -> h @ listReverse t


(* -------------------------------------- *)

let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | t -> __var_1__
    | h :: t -> h @ listReverse t


(* -------------------------------------- *)

let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | t -> listReverse t
    | h :: t -> h @ listReverse t


(* -------------------------------------- *)


(* bad

let rec listReverse l =
  match l with | [] -> [] | t -> t | h::t -> h @ (listReverse t);;

*)

(* student fix

let rec listReverse l =
  match l with | [] -> [] | t -> t | h::t -> t @ (listReverse [h]);;

*)

(* changed spans

(3,46)-(3,47)
t
VarG

(3,63)-(3,64)
[h]
ListG [VarG]

*)
