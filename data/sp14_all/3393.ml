
let f a b a = a * b;;

let pipe fs =
  let f a x = f (x a) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x b = x (a b) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(5,15)-(5,22)
fun b -> x (a b)
LamG VarPatG (AppG (fromList [EmptyG]))

*)

(* type error slice
(2,4)-(2,22)
(2,7)-(2,20)
(2,9)-(2,20)
(2,11)-(2,20)
(2,15)-(2,20)
(2,19)-(2,20)
(5,3)-(5,68)
(5,9)-(5,22)
(5,11)-(5,22)
(5,15)-(5,16)
(5,15)-(5,22)
(5,26)-(5,68)
(5,35)-(5,40)
(5,39)-(5,40)
(5,44)-(5,58)
(5,44)-(5,68)
(5,59)-(5,60)
(5,61)-(5,65)
*)
