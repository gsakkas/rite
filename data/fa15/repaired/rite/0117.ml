let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | h -> [h]
    | h :: t -> t :: (listReverse [h])


(* -------------------------------------- *)

let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | h -> h
    | h :: t -> h :: (listReverse [h])


(* -------------------------------------- *)

let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | h -> h
    | h :: t -> 0 :: (listReverse [h])


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
