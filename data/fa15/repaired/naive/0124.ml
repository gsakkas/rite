let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | t -> t
    | h :: t -> [h] @ listReverse [0]


(* -------------------------------------- *)

let rec listReverse =
  fun l ->
    match __var_1__ with
    | [] -> []
    | t -> t
    | h :: t -> [h] @ listReverse [t]


(* -------------------------------------- *)

let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | t -> t
    | h :: t -> [h] @ listReverse [__var_1__]


(* -------------------------------------- *)


(* bad

let rec listReverse l =
  match l with | [] -> [] | t -> t | h::t -> [h] @ (listReverse [t]);;

*)

(* student fix

let rec listReverse l =
  match l with | [] -> [] | t -> t | h::t -> t @ (listReverse [h]);;

*)

(* changed spans

(3,46)-(3,49)
t
VarG

(3,66)-(3,67)
h
VarG

*)
