
let rec sumList xs = match xs with | [] -> [] | x::xs' -> x + (1 sumList xs');;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

*)

(* changed spans
(2,43)-(2,45)
0
LitG

(2,63)-(2,64)
sumList xs'
AppG [VarG]

*)
