let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | h :: t -> listReverse (h :: l)


(* -------------------------------------- *)

let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | h :: t -> listReverse (h :: t)


(* -------------------------------------- *)

let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | h :: t -> listReverse (0 :: t)


(* -------------------------------------- *)


(* bad

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) :: h;;

*)

(* student fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (listReverse t);;

*)

(* changed spans

(3,37)-(3,52)
h
VarG

(3,56)-(3,57)
listReverse t
AppG [VarG]

*)
