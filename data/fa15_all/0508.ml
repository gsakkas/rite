
let pipe fs =
  let f a x result = a x in let base = f 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x n = x (a n) in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(3,13)-(3,25)
fun n -> x (a n)
LamG VarPatG (AppG (fromList [EmptyG]))

(3,40)-(3,43)
fun f -> 0
LamG VarPatG LitG

*)

(* type error slice
(3,3)-(3,71)
(3,9)-(3,25)
(3,22)-(3,23)
(3,22)-(3,25)
(3,40)-(3,41)
(3,40)-(3,43)
(3,42)-(3,43)
*)
