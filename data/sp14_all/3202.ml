
let sqsum xs = let f a x = () in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = a * a in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(2,28)-(2,30)
a * a
BopG VarG VarG

*)

(* type error slice
(2,16)-(2,74)
(2,22)-(2,30)
(2,24)-(2,30)
(2,28)-(2,30)
(2,34)-(2,74)
(2,45)-(2,46)
(2,50)-(2,64)
(2,50)-(2,74)
(2,65)-(2,66)
(2,67)-(2,71)
*)
