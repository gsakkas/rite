
let sqsum xs =
  let f a x = a + (x ** 2.) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,21)-(3,23)
x * x
BopG VarG VarG

(3,24)-(3,26)
x
VarG

*)
