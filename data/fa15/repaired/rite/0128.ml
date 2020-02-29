let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | h :: t -> listReverse [listReverse t ; h]


(* -------------------------------------- *)

let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | h :: t -> listReverse [h]


(* -------------------------------------- *)

let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | h :: t -> listReverse [listReverse t]


(* -------------------------------------- *)


(* bad

let rec listReverse l = match l with | [] -> [] | h::t -> [listReverse t; h];;

*)

(* student fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (listReverse t);;

*)

(* changed spans

(2,59)-(2,77)
h :: (listReverse t)
AppG [VarG,AppG [EmptyG]]

*)
