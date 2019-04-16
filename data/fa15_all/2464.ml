
let sqsum xs =
  let f a x mb x = (x * x) + a in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (x * x) + a in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,13)-(3,31)
(x * x) + a
BopG (BopG EmptyG EmptyG) VarG

*)

(* type error slice
(3,3)-(3,75)
(3,9)-(3,31)
(3,11)-(3,31)
(3,13)-(3,31)
(3,20)-(3,31)
(3,30)-(3,31)
(3,51)-(3,65)
(3,51)-(3,75)
(3,66)-(3,67)
*)
