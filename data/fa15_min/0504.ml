
let pipe fs =
  let f a x result x = a x in let base = 1 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x n = x (a n) in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(3,13)-(3,27)
fun n -> x (a n)
LamG VarPatG (AppG [EmptyG])

(3,42)-(3,43)
fun f -> 0
LamG VarPatG LitG

*)

(* type error slice
(3,3)-(3,71)
(3,9)-(3,27)
(3,11)-(3,27)
(3,13)-(3,27)
(3,20)-(3,27)
(3,24)-(3,25)
(3,24)-(3,27)
(3,47)-(3,61)
(3,47)-(3,71)
(3,62)-(3,63)
*)
