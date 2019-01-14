
let rec sumList xs = match xs with | [] -> [] | h::t -> 2 + 2;;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList xs);;

*)

(* changed spans
(2,43)-(2,45)
0
LitG

(2,60)-(2,61)
h
VarG

*)
