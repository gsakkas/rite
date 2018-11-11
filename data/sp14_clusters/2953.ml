
let sqsum xs =
  let f a x = (a ** 2) + x in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,17)-(3,19)
a * a
BopG VarG VarG

(3,20)-(3,21)
a
VarG

*)
