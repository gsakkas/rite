
let sqsum xs =
  let f a x = a ^ (2 :: x) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,15)
a * a
BopG VarG VarG

(3,16)-(3,17)
(a * a) + x
BopG (BopG EmptyG EmptyG) VarG

(3,19)-(3,20)
a
VarG

*)
