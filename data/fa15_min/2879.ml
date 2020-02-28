
let sqsum xs =
  let f a x = (a ** 2) + (x ** 2) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,15)-(3,23)
a * a
BopG VarG VarG

(3,26)-(3,34)
x * x
BopG VarG VarG

*)

(* type error slice
(3,3)-(3,78)
(3,9)-(3,34)
(3,11)-(3,34)
(3,15)-(3,23)
(3,15)-(3,34)
(3,16)-(3,17)
(3,18)-(3,20)
(3,21)-(3,22)
(3,26)-(3,34)
(3,29)-(3,31)
(3,32)-(3,33)
(3,54)-(3,68)
(3,54)-(3,78)
(3,69)-(3,70)
*)
