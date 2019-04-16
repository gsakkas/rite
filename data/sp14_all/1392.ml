
let pipe fs =
  let f a x f x f a = f a x in let base y z = z in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x z = x (a z) in let base z = z in List.fold_left f base fs;;

*)

(* changed spans
(3,13)-(3,28)
fun z -> x (a z)
LamG VarPatG (AppG (fromList [EmptyG]))

(3,41)-(3,48)
fun z -> z
LamG VarPatG VarG

*)

(* type error slice
(3,3)-(3,76)
(3,9)-(3,28)
(3,11)-(3,28)
(3,13)-(3,28)
(3,15)-(3,28)
(3,17)-(3,28)
(3,23)-(3,24)
(3,23)-(3,28)
(3,27)-(3,28)
(3,32)-(3,76)
(3,41)-(3,48)
(3,43)-(3,48)
(3,47)-(3,48)
(3,52)-(3,66)
(3,52)-(3,76)
(3,67)-(3,68)
(3,69)-(3,73)
*)
