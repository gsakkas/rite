
let sqsum xs =
  let f a x = a + (x ** 2) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (int_of_float ((float_of_int x) ** 2.0)) in
  let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,19)-(3,27)
int_of_float (float_of_int x ** 2.0)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(3,19)-(3,27)
(3,22)-(3,24)
(3,25)-(3,26)
*)
