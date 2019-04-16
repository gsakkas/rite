
let rec sumList xs = match xs with | [] -> [] | h::t -> h + (sumList xs);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList xs);;

*)

(* changed spans
(2,44)-(2,46)
0
LitG

*)

(* type error slice
(2,4)-(2,75)
(2,17)-(2,73)
(2,22)-(2,73)
(2,44)-(2,46)
(2,57)-(2,73)
(2,61)-(2,73)
(2,62)-(2,69)
*)
