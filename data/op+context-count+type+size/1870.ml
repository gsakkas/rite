
let sqsum xs =
  let f a x = a + (x ** 2.0) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (int_of_float ((float_of_int x) ** 2.0)) in
  let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,20)-(3,21)
(3,20)-(3,28)
(3,33)-(3,73)
*)

(* type error slice
(3,15)-(3,28)
(3,20)-(3,28)
(3,22)-(3,24)
*)
