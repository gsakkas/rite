
let sqsum xs =
  let f a x = a +. (x ** 2.0) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (int_of_float ((float_of_int x) ** 2.0)) in
  let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,29)
a + int_of_float (float_of_int x ** 2.0)
BopG VarG (AppG (fromList [EmptyG]))

(3,19)-(3,29)
int_of_float
VarG

(3,19)-(3,29)
int_of_float (float_of_int x ** 2.0)
AppG (fromList [AppG (fromList [EmptyG])])

(3,20)-(3,21)
float_of_int
VarG

(3,20)-(3,21)
float_of_int x
AppG (fromList [VarG])

*)
