
let sqsum xs =
  let f a x sum x = sum + (x * x) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,13)-(3,34)
a + (x * x)
BopG VarG (BopG EmptyG EmptyG)

*)

(* type error slice
(3,3)-(3,78)
(3,9)-(3,34)
(3,11)-(3,34)
(3,13)-(3,34)
(3,38)-(3,78)
(3,49)-(3,50)
(3,54)-(3,68)
(3,54)-(3,78)
(3,69)-(3,70)
(3,71)-(3,75)
*)
