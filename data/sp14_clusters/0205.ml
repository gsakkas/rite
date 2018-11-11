
let rec sumList xs = match xs with | [] -> [] | x::xs' -> 1 sumList xs';;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

*)

(* changed spans
(2,58)-(2,59)
0
LitG

(2,60)-(2,67)
x
VarG

(2,60)-(2,67)
sumList xs'
AppG [VarG]

(2,60)-(2,67)
x + sumList xs'
BopG VarG (AppG [EmptyG])

*)
