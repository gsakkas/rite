let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | h -> [h]
    | h :: t -> listReverse [0]


(* -------------------------------------- *)

let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | h -> [h]
    | h :: t -> listReverse [__var_1__]


(* -------------------------------------- *)

let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | h -> [h]
    | h :: t -> listReverse l


(* -------------------------------------- *)


(* bad

let rec listReverse l =
  match l with | [] -> [] | h -> [h] | h::t -> t @ (listReverse [h]);;

*)

(* student fix

let rec listReverse l =
  match l with | [] -> [] | h -> h | h::t -> t @ (listReverse [h]);;

*)

(* changed spans

(3,34)-(3,37)
h
VarG

*)
