
let sqsum xs = let f a x = (+.) in let base = 0. in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = a + x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(2,27)-(2,31)
a + x
BopG VarG VarG

(2,35)-(2,76)
a
VarG

(2,35)-(2,76)
x
VarG

(2,46)-(2,48)
0
LitG

*)
