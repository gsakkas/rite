
let sqsum xs = let f a x = () in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = a * a in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(2,27)-(2,29)
a * a
BopG VarG VarG

(2,33)-(2,73)
a
VarG

(2,33)-(2,73)
a
VarG

*)
