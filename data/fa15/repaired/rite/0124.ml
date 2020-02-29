let rec listReverse =
  fun l ->
    match [] with
    | [] -> []
    | t -> t
    | h :: t -> [h] @ listReverse [t]


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
    match listReverse l with
    | [] -> []
    | t -> t
    | h :: t -> [h] @ listReverse [t]


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
