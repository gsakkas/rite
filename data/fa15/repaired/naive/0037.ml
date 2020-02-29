let rec sumList =
  fun xs ->
    match xs with
    | [] -> __var_1__
    | x :: xs' -> x + sumList xs'


(* -------------------------------------- *)

let rec sumList =
  fun xs ->
    match xs with
    | [] -> sumList (0 :: [])
    | x :: xs' -> x + sumList xs'


(* -------------------------------------- *)

let rec sumList =
  fun xs ->
    match xs with
    | [] -> sumList ([] @ [])
    | x :: xs' -> x + sumList xs'


(* -------------------------------------- *)


(* bad

let rec sumList xs = match xs with | [] -> [] | x::xs' -> x + (sumList xs');;

*)

(* student fix

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

*)

(* changed spans

(2,44)-(2,46)
0
LitG

*)
