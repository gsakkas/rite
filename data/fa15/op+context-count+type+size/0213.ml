
let sqsum xs =
  let f a x a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,12)-(3,29)
(3,14)-(3,29)
(3,33)-(3,73)
*)

(* type error slice
(3,2)-(3,73)
(3,8)-(3,29)
(3,10)-(3,29)
(3,12)-(3,29)
(3,33)-(3,73)
(3,44)-(3,45)
(3,49)-(3,63)
(3,49)-(3,73)
(3,64)-(3,65)
(3,66)-(3,70)
*)
