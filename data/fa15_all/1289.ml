
let rec sumList xs = match xs with | [] -> 0 | h::t -> h :: (sumList t);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,56)-(2,72)
h + sumList t
BopG VarG (AppG (fromList [EmptyG]))

*)

(* type error slice
(2,4)-(2,74)
(2,17)-(2,72)
(2,22)-(2,72)
(2,44)-(2,45)
(2,56)-(2,72)
(2,61)-(2,72)
(2,62)-(2,69)
*)
