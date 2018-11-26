
let sqsum xs =
  let f a x = a ^ (2 :: x) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,16)-(3,17)
a + (x * x)
BopG VarG (BopG EmptyG EmptyG)

(3,19)-(3,20)
x * x
BopG VarG VarG

(3,30)-(3,70)
x
VarG

*)
