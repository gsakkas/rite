
let sqsum xs =
  let f a x = a +. (x *. x) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,27)
a + (x * x)
BopG VarG (BopG EmptyG EmptyG)

(3,19)-(3,27)
x * x
BopG VarG VarG

*)
