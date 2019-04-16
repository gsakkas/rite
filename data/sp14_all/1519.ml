
let pipe fs =
  let f a x y = y a x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x x = a x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,13)-(3,22)
fun x -> a x
LamG VarPatG (AppG (fromList [EmptyG]))

(3,35)-(3,40)
fun y -> y
LamG VarPatG VarG

*)

(* type error slice
(3,3)-(3,68)
(3,9)-(3,22)
(3,11)-(3,22)
(3,13)-(3,22)
(3,17)-(3,18)
(3,17)-(3,22)
(3,19)-(3,20)
(3,44)-(3,58)
(3,44)-(3,68)
(3,59)-(3,60)
*)
