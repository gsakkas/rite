let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | h :: t -> listReverse __lit__


(* -------------------------------------- *)

let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | h :: t -> listReverse l


(* -------------------------------------- *)

let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | h :: t -> listReverse __var_1__


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
