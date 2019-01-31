
let f a x = a * a;;

let sqsum xs =
  let f a x = let aa = a * a in aa + f in
  let base = List.hd xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + (x * x) in
  let base = List.hd xs in List.fold_left f base xs;;

*)

(* changed spans
(5,14)-(5,38)
(a * a) + (x * x)
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

(5,37)-(5,38)
x * x
BopG VarG VarG

(6,2)-(6,51)
x
VarG

(6,2)-(6,51)
x
VarG

*)
