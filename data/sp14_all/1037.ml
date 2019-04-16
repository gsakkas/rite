
let sqsum xs = let f a x = (+.) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = a + x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(2,28)-(2,32)
a + x
BopG VarG VarG

*)

(* type error slice
(2,16)-(2,76)
(2,22)-(2,32)
(2,24)-(2,32)
(2,28)-(2,32)
(2,36)-(2,76)
(2,47)-(2,48)
(2,52)-(2,66)
(2,52)-(2,76)
(2,67)-(2,68)
(2,69)-(2,73)
*)
