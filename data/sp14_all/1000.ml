
let pipe fs = let f a x d x = a in let base p = p in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base p = p in List.fold_left f base fs;;

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
(2,27)-(2,32)
(2,31)-(2,32)
(2,54)-(2,68)
(2,54)-(2,78)
(2,69)-(2,70)
*)
