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
    | h :: t -> listReverse __lit__


(* -------------------------------------- *)

let rec listReverse =
  fun l ->
    match l with
    | [] -> []
    | h :: t -> listReverse __var_1__


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
