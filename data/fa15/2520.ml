
let sqsum xs =
  let f a x a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,12)-(3,29)
(3,14)-(3,29)
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

(* all spans
(2,10)-(3,73)
(3,2)-(3,73)
(3,8)-(3,29)
(3,10)-(3,29)
(3,12)-(3,29)
(3,14)-(3,29)
(3,18)-(3,29)
(3,18)-(3,19)
(3,22)-(3,29)
(3,23)-(3,24)
(3,27)-(3,28)
(3,33)-(3,73)
(3,44)-(3,45)
(3,49)-(3,73)
(3,49)-(3,63)
(3,64)-(3,65)
(3,66)-(3,70)
(3,71)-(3,73)
*)
