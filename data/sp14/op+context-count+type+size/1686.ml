
let sqsum xs =
  let f a x = a +. (x ** 2.0) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (int_of_float ((float_of_int x) ** 2.0)) in
  let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,29)
(3,19)-(3,29)
(3,20)-(3,21)
(3,33)-(3,73)
*)

(* type error slice
(3,2)-(3,73)
(3,8)-(3,29)
(3,14)-(3,15)
(3,14)-(3,29)
(3,33)-(3,73)
(3,44)-(3,45)
(3,49)-(3,63)
(3,49)-(3,73)
(3,64)-(3,65)
(3,66)-(3,70)
*)
