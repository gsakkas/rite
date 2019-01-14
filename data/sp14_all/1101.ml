
let sqsum xs = let f a x = x ** 2 in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = x * x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(2,29)-(2,31)
x * x
BopG VarG VarG

(2,32)-(2,33)
x
VarG

*)
