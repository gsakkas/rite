
let pipe fs =
  let f a x result = a x in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x n = x (a n) in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(3,13)-(3,25)
fun n -> x (a n)
LamG VarPatG (AppG (fromList [EmptyG]))

(3,40)-(3,41)
fun f -> 0
LamG VarPatG LitG

*)

(* type error slice
(3,3)-(3,69)
(3,9)-(3,25)
(3,22)-(3,23)
(3,22)-(3,25)
(3,29)-(3,69)
(3,40)-(3,41)
(3,45)-(3,59)
(3,45)-(3,69)
(3,60)-(3,61)
(3,62)-(3,66)
*)
