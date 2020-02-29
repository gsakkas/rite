let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | t -> t
    | h :: t -> ((@) :: h) :: __lit__


(* -------------------------------------- *)

let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | t -> t
    | h :: t -> __fun_1__ (__fun_2__ __var_1__)


(* -------------------------------------- *)

let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | t -> t
    | h :: t -> __fun_1__ (__fun_2__ __var_1__)
                          __lit__


(* -------------------------------------- *)


(* bad

let rec listReverse l =
  match l with | [] -> [] | t -> t | h::t -> h @ (listReverse [t]);;

*)

(* student fix

let rec listReverse l =
  match l with | [] -> [] | t -> t | h::t -> t @ (listReverse [h]);;

*)

(* changed spans

(3,46)-(3,47)
t
VarG

(3,64)-(3,65)
h
VarG

*)
