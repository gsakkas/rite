
let sqsum xs = let f a x = (+.) in let base = 0. in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = a + x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(2,28)-(2,32)
a + x
BopG VarG VarG

(2,47)-(2,49)
0
LitG

*)

(* type error slice
(2,16)-(2,77)
(2,22)-(2,32)
(2,24)-(2,32)
(2,28)-(2,32)
(2,36)-(2,77)
(2,47)-(2,49)
(2,53)-(2,67)
(2,53)-(2,77)
(2,68)-(2,69)
(2,70)-(2,74)
*)
