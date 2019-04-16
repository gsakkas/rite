
let pipe fs =
  let f a x n = n (a x) in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x n = x (a n) in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(3,17)-(3,24)
x (a n)
AppG (fromList [AppG (fromList [EmptyG])])

(3,39)-(3,40)
fun f -> 0
LamG VarPatG LitG

*)

(* type error slice
(3,3)-(3,68)
(3,9)-(3,24)
(3,19)-(3,24)
(3,20)-(3,21)
(3,28)-(3,68)
(3,39)-(3,40)
(3,44)-(3,58)
(3,44)-(3,68)
(3,59)-(3,60)
(3,61)-(3,65)
*)
