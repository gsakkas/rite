
let sqsum xs = let f a x = a ** x in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(2,29)-(2,31)
a + (x * x)
BopG VarG (BopG EmptyG EmptyG)

(2,32)-(2,33)
x * x
BopG VarG VarG

(2,37)-(2,77)
x
VarG

*)
