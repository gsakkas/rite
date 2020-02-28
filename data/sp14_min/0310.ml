
let rec sumList xs = match 1 with | [] -> 0 | h::t -> h + (sumList t);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,28)-(2,29)
xs
VarG

*)

(* type error slice
(2,22)-(2,70)
(2,28)-(2,29)
*)
