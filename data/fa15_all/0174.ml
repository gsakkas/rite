
let sqsum xs =
  let f a x = a +. (x ** 2.0) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,29)
a + (x * x)
BopG VarG (BopG EmptyG EmptyG)

(3,22)-(3,24)
x * x
BopG VarG VarG

(3,25)-(3,28)
x
VarG

*)
