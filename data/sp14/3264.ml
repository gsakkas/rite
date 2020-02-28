
let sqsum xs =
  let f a x x = x * x in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = x * x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,13)-(3,22)
x * x
BopG VarG VarG

*)

(* type error slice
(3,3)-(3,66)
(3,9)-(3,22)
(3,11)-(3,22)
(3,13)-(3,22)
(3,26)-(3,66)
(3,37)-(3,38)
(3,42)-(3,56)
(3,42)-(3,66)
(3,57)-(3,58)
(3,59)-(3,63)
*)
