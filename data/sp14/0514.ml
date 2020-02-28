
let sqsum xs =
  let f a x = a +. (x ** 2.0) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (int_of_float ((float_of_int x) ** 2.0)) in
  let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,15)-(3,30)
a + int_of_float (float_of_int x ** 2.0)
BopG VarG (AppG [EmptyG])

*)

(* type error slice
(3,3)-(3,74)
(3,9)-(3,30)
(3,15)-(3,16)
(3,15)-(3,30)
(3,34)-(3,74)
(3,45)-(3,46)
(3,50)-(3,64)
(3,50)-(3,74)
(3,65)-(3,66)
(3,67)-(3,71)
*)
