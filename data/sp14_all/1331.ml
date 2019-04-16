
let pipe fs =
  let f a x x' y = (x a) + a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = x a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,13)-(3,29)
fun a -> x a
LamG VarPatG (AppG (fromList [EmptyG]))

*)

(* type error slice
(3,3)-(3,75)
(3,9)-(3,29)
(3,11)-(3,29)
(3,13)-(3,29)
(3,20)-(3,29)
(3,28)-(3,29)
(3,51)-(3,65)
(3,51)-(3,75)
(3,66)-(3,67)
*)
