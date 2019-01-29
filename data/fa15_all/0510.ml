
let sqsum xs = let f a x = (+) x in let base = [] in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = a + x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(2,27)-(2,30)
a + x
BopG VarG VarG

(2,31)-(2,32)
a
VarG

(2,47)-(2,49)
0
LitG

*)
