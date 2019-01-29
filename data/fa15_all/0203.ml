
let rec sumList xs = match xs with | [] -> [] | x::xs' -> x sumList xs';;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

*)

(* changed spans
(2,58)-(2,59)
x + sumList xs'
BopG VarG (AppG (fromList [EmptyG]))

(2,58)-(2,71)
0
LitG

(2,60)-(2,67)
sumList xs'
AppG (fromList [VarG])

*)
