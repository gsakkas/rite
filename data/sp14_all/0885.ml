
let sqsum xs =
  let f a x = (a ^ 2.) :: x in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,15)-(3,28)
(a * a) + x
BopG (BopG EmptyG EmptyG) VarG

*)

(* type error slice
(3,3)-(3,72)
(3,9)-(3,28)
(3,11)-(3,28)
(3,15)-(3,23)
(3,15)-(3,28)
(3,16)-(3,17)
(3,18)-(3,19)
(3,20)-(3,22)
(3,48)-(3,62)
(3,48)-(3,72)
(3,63)-(3,64)
*)
