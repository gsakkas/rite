
let sqsum xs =
  let f a x = x ** 2.0 in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = x * x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,16)-(3,18)
x * x
BopG VarG VarG

(3,19)-(3,22)
x
VarG

*)
