
let sqsum xs =
  let f a x = (a ** 2.) +. x in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,16)-(3,17)
(3,16)-(3,23)
(3,16)-(3,29)
(3,18)-(3,20)
(3,21)-(3,23)
(3,33)-(3,73)
*)

(* type error slice
(3,3)-(3,73)
(3,9)-(3,29)
(3,16)-(3,17)
(3,16)-(3,23)
(3,18)-(3,20)
(3,33)-(3,73)
(3,44)-(3,45)
(3,49)-(3,63)
(3,49)-(3,73)
(3,64)-(3,65)
(3,66)-(3,70)
*)
