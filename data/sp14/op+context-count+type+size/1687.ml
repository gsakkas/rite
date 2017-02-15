
let sqsum xs =
  let f a x = a + (x ** 2.0) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (int_of_float ((float_of_int x) ** 2.0)) in
  let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,18)-(3,28)
(3,19)-(3,20)
(3,32)-(3,72)
*)

(* type error slice
(3,14)-(3,28)
(3,18)-(3,28)
(3,21)-(3,23)
*)
