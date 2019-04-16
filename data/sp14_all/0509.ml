
let pipe fs = let f a x = a x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x q = x (a q) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,30)
fun q -> x (a q)
LamG VarPatG (AppG (fromList [EmptyG]))

*)

(* type error slice
(2,15)-(2,76)
(2,21)-(2,30)
(2,23)-(2,30)
(2,27)-(2,28)
(2,27)-(2,30)
(2,52)-(2,66)
(2,52)-(2,76)
(2,67)-(2,68)
*)
