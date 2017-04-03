
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
*)

(* type error slice
(3,14)-(3,28)
(3,18)-(3,28)
(3,21)-(3,23)
*)

(* all spans
(2,10)-(3,72)
(3,2)-(3,72)
(3,8)-(3,28)
(3,10)-(3,28)
(3,14)-(3,28)
(3,14)-(3,15)
(3,18)-(3,28)
(3,21)-(3,23)
(3,19)-(3,20)
(3,24)-(3,27)
(3,32)-(3,72)
(3,43)-(3,44)
(3,48)-(3,72)
(3,48)-(3,62)
(3,63)-(3,64)
(3,65)-(3,69)
(3,70)-(3,72)
*)
