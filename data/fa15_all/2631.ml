
let sqsum xs =
  let f a x a x = x *. x in let base = 0.0 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = x * x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,18)-(3,24)
x * x
BopG VarG VarG

(3,39)-(3,42)
0
LitG

*)
