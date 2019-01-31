
let rec sumList xs = match xs with | [] -> 0 | h::t -> h :: (sumList t);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,55)-(2,71)
h + sumList t
BopG VarG (AppG (fromList [EmptyG]))

*)
