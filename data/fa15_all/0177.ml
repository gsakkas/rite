
let rec sumList xs = match xs with | [] -> [] | h::t -> h + sumList;;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList xs);;

*)

(* changed spans
(2,44)-(2,46)
0
LitG

(2,61)-(2,68)
sumList xs
AppG [VarG]

*)

(* type error slice
(2,4)-(2,70)
(2,17)-(2,68)
(2,22)-(2,68)
(2,44)-(2,46)
(2,57)-(2,68)
(2,61)-(2,68)
*)
