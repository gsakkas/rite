
let pipe fs = let f a x a = a x in let base n = n in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(2,25)-(2,32)
fun x -> fun a -> x a
LamG VarPatG (LamG VarPatG EmptyG)

*)

(* type error slice
(2,15)-(2,78)
(2,21)-(2,32)
(2,23)-(2,32)
(2,25)-(2,32)
(2,29)-(2,30)
(2,29)-(2,32)
(2,36)-(2,78)
(2,45)-(2,50)
(2,49)-(2,50)
(2,54)-(2,68)
(2,54)-(2,78)
(2,69)-(2,70)
(2,71)-(2,75)
*)
