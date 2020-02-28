
let rec sumList xs = match xs with | [] -> [] | x::xs' -> 1 sumList xs';;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

*)

(* changed spans
(2,44)-(2,46)
0
LitG

(2,59)-(2,72)
x + sumList xs'
BopG VarG (AppG [EmptyG])

*)

(* type error slice
(2,59)-(2,60)
(2,59)-(2,72)
*)
