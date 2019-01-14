
let sqsum xs = let f a x = x * x in let base = 0 in List.fold_right f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(2,27)-(2,32)
a
VarG

(2,27)-(2,32)
a + (x * x)
BopG VarG (BopG EmptyG EmptyG)

(2,52)-(2,67)
List.fold_left
VarG

*)
