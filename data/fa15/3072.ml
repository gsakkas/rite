
let sqsum xs =
  let f a x = (a + x) ^ 2 in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,15)-(3,26)
a + (x * x)
BopG VarG (BopG EmptyG EmptyG)

*)

(* type error slice
(3,15)-(3,22)
(3,15)-(3,26)
(3,23)-(3,24)
*)
