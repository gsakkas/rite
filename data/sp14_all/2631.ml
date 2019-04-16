
let sqsum xs =
  let f a x a x = x *. x in let base = 0.0 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = x * x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,13)-(3,25)
x * x
BopG VarG VarG

(3,40)-(3,43)
0
LitG

*)

(* type error slice
(3,3)-(3,71)
(3,9)-(3,25)
(3,11)-(3,25)
(3,13)-(3,25)
(3,29)-(3,71)
(3,40)-(3,43)
(3,47)-(3,61)
(3,47)-(3,71)
(3,62)-(3,63)
(3,64)-(3,68)
*)
