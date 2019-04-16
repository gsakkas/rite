
let sqsum xs =
  let f a x a x = (x * x) + a in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (x * x) + a in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,13)-(3,30)
(x * x) + a
BopG (BopG EmptyG EmptyG) VarG

*)

(* type error slice
(3,3)-(3,74)
(3,9)-(3,30)
(3,11)-(3,30)
(3,13)-(3,30)
(3,34)-(3,74)
(3,45)-(3,46)
(3,50)-(3,64)
(3,50)-(3,74)
(3,65)-(3,66)
(3,67)-(3,71)
*)
