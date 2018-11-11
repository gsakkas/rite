
let sqsum xs =
  let f a x = (a ** 2.) +. x in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,15)-(3,16)
a * a
BopG VarG VarG

(3,17)-(3,19)
(a * a) + x
BopG (BopG EmptyG EmptyG) VarG

(3,20)-(3,22)
a
VarG

*)
