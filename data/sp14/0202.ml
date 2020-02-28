
let rec sumList xs = match xs with | [] -> [] | x::xs' -> x + (1 sumList xs');;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

*)

(* changed spans
(2,44)-(2,46)
0
LitG

(2,63)-(2,78)
sumList xs'
AppG [VarG]

*)

(* type error slice
(2,22)-(2,78)
(2,44)-(2,46)
(2,59)-(2,78)
(2,63)-(2,78)
(2,64)-(2,65)
*)
