
let sqsum xs =
  let f a x = a ^ (2 :: x) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,15)-(3,27)
a + (x * x)
BopG VarG (BopG EmptyG EmptyG)

*)

(* type error slice
(3,3)-(3,71)
(3,9)-(3,27)
(3,15)-(3,16)
(3,15)-(3,27)
(3,17)-(3,18)
(3,19)-(3,27)
(3,31)-(3,71)
(3,42)-(3,43)
(3,47)-(3,61)
(3,47)-(3,71)
(3,62)-(3,63)
(3,64)-(3,68)
*)
