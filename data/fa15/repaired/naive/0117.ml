let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | h -> h
    | h :: t -> __var_1__ :: (listReverse [h])


(* -------------------------------------- *)

let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | h -> __var_1__
    | h :: t -> t :: (listReverse [h])


(* -------------------------------------- *)

let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | h -> listReverse h
    | h :: t -> t :: (listReverse [h])


(* -------------------------------------- *)


(* bad

let rec listReverse l =
  match l with | [] -> [] | h -> h | h::t -> t :: (listReverse [h]);;

*)

(* student fix

let rec listReverse l =
  match l with | [] -> [] | h -> h | h::t -> t @ (listReverse [h]);;

*)

(* changed spans

(3,46)-(3,68)
t @ listReverse [h]
AppG [VarG,AppG [EmptyG]]

*)
