
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
*)

(* type error slice
(2,4)-(3,75)
(2,11)-(3,73)
(3,3)-(3,73)
(3,9)-(3,28)
(3,11)-(3,28)
(3,15)-(3,16)
(3,15)-(3,28)
(3,15)-(3,28)
(3,20)-(3,21)
(3,20)-(3,28)
(3,20)-(3,28)
(3,22)-(3,24)
(3,25)-(3,28)
(3,49)-(3,63)
(3,49)-(3,73)
(3,49)-(3,73)
(3,49)-(3,73)
(3,64)-(3,65)
(3,71)-(3,73)
*)
