
let pipe fs =
  let f a x combine c = a c in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x c = x (a c) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,13)-(3,28)
fun c -> x (a c)
LamG VarPatG (AppG (fromList [EmptyG]))

*)

(* type error slice
(3,3)-(3,74)
(3,9)-(3,28)
(3,11)-(3,28)
(3,13)-(3,28)
(3,21)-(3,28)
(3,25)-(3,26)
(3,25)-(3,28)
(3,50)-(3,64)
(3,50)-(3,74)
(3,65)-(3,66)
*)
