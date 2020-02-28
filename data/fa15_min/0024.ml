
let sqsum xs =
  let f a x = a + (x ** 2.) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,19)-(3,28)
x * x
BopG VarG VarG

*)

(* type error slice
(3,15)-(3,28)
(3,19)-(3,28)
(3,22)-(3,24)
*)
