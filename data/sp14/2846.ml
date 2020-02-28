
let rec sumList xs = match sumList with | [] -> 0 | h::t -> h + (sumList t);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,28)-(2,35)
xs
VarG

*)

(* type error slice
(2,22)-(2,76)
(2,28)-(2,35)
(2,65)-(2,76)
(2,66)-(2,73)
*)
