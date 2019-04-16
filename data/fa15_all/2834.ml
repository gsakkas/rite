
let x l = List.map string_of_int;;

let pipe fs =
  let f a x x = x a in let base f = f x in List.fold_left f base fs;;


(* fix

let f a x x a = a x;;

let pipe fs =
  let f a x g = f a x in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(5,13)-(5,20)
fun g -> f a x
LamG VarPatG (AppG (fromList [EmptyG]))

(5,37)-(5,40)
f
VarG

*)

(* type error slice
(5,3)-(5,68)
(5,9)-(5,20)
(5,11)-(5,20)
(5,13)-(5,20)
(5,17)-(5,18)
(5,17)-(5,20)
(5,19)-(5,20)
(5,44)-(5,58)
(5,44)-(5,68)
(5,59)-(5,60)
*)
