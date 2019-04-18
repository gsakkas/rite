
let sqsum xs = let f a x = (+) x in let base = [] in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = a + x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(2,28)-(2,33)
a + x
BopG VarG VarG

(2,48)-(2,50)
0
LitG

*)

(* type error slice
(2,16)-(2,78)
(2,22)-(2,33)
(2,24)-(2,33)
(2,28)-(2,31)
(2,28)-(2,33)
(2,37)-(2,78)
(2,48)-(2,50)
(2,54)-(2,68)
(2,54)-(2,78)
(2,69)-(2,70)
(2,71)-(2,75)
*)
