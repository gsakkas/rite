
let sqsum xs =
  let f a x = x ** 2.0 in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = x * x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,15)-(3,23)
x * x
BopG VarG VarG

*)

(* type error slice
(3,3)-(3,67)
(3,9)-(3,23)
(3,11)-(3,23)
(3,15)-(3,23)
(3,17)-(3,19)
(3,27)-(3,67)
(3,38)-(3,39)
(3,43)-(3,57)
(3,43)-(3,67)
(3,58)-(3,59)
(3,60)-(3,64)
*)
