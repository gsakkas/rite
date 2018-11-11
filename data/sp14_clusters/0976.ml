
let sqsum xs = let f a x = a ** x in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(2,27)-(2,28)
a * a
BopG VarG VarG

(2,29)-(2,31)
(a * a) + (x * x)
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

(2,32)-(2,33)
a
VarG

(2,32)-(2,33)
x * x
BopG VarG VarG

(2,37)-(2,77)
x
VarG

*)
