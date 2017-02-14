
let sqsum xs =
  let f a x a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,13)-(3,29)
(3,15)-(3,29)
(3,34)-(3,74)
*)

(* type error slice
(3,3)-(3,74)
(3,9)-(3,29)
(3,11)-(3,29)
(3,13)-(3,29)
(3,34)-(3,74)
(3,45)-(3,46)
(3,50)-(3,64)
(3,50)-(3,74)
(3,65)-(3,66)
(3,67)-(3,71)
*)
