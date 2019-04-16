
let pipe fs =
  let f a x x = x a in let base f = f fs in List.fold_left f base fs;;


(* fix

let f a x x a = a x;;

let pipe fs =
  let f a x g = f a x in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(3,13)-(3,20)
fun g -> f a x
LamG VarPatG (AppG (fromList [EmptyG]))

(3,37)-(3,41)
f
VarG

*)

(* type error slice
(3,3)-(3,69)
(3,9)-(3,20)
(3,11)-(3,20)
(3,13)-(3,20)
(3,17)-(3,18)
(3,17)-(3,20)
(3,19)-(3,20)
(3,45)-(3,59)
(3,45)-(3,69)
(3,60)-(3,61)
*)
