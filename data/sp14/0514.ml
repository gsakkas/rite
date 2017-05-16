
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
*)

(* type error slice
(3,18)-(3,26)
(3,21)-(3,23)
(3,24)-(3,25)
*)

(* all spans
(2,10)-(3,70)
(3,2)-(3,70)
(3,8)-(3,26)
(3,10)-(3,26)
(3,14)-(3,26)
(3,14)-(3,15)
(3,18)-(3,26)
(3,21)-(3,23)
(3,19)-(3,20)
(3,24)-(3,25)
(3,30)-(3,70)
(3,41)-(3,42)
(3,46)-(3,70)
(3,46)-(3,60)
(3,61)-(3,62)
(3,63)-(3,67)
(3,68)-(3,70)
*)
