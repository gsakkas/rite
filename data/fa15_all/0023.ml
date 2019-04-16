
let sqsum xs =
  let f a x = a + (x ** 2) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,19)-(3,27)
x * x
BopG VarG VarG

*)

(* type error slice
(3,19)-(3,27)
(3,22)-(3,24)
(3,25)-(3,26)
*)
