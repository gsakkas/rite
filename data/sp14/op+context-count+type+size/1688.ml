
let sqsum xs =
  let f a x = a + (x ** 2) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (int_of_float ((float_of_int x) ** 2.0)) in
  let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,18)-(3,26)
(3,19)-(3,20)
(3,24)-(3,25)
(3,30)-(3,70)
(3,41)-(3,42)
*)

(* type error slice
(3,18)-(3,26)
(3,21)-(3,23)
(3,24)-(3,25)
*)
