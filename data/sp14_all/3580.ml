
let sqsum xs =
  let f a x = (a ** 2.) + x in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,15)-(3,24)
a * a
BopG VarG VarG

*)

(* type error slice
(3,15)-(3,24)
(3,15)-(3,28)
(3,18)-(3,20)
*)
