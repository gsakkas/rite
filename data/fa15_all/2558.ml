
let pipe fs = let f a x = fs a x in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x b = x (a b) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,33)
fun b -> x (a b)
LamG VarPatG (AppG (fromList [EmptyG]))

(2,48)-(2,49)
fun x -> x
LamG VarPatG VarG

*)

(* type error slice
(2,27)-(2,29)
(2,27)-(2,33)
(2,53)-(2,67)
(2,53)-(2,77)
(2,75)-(2,77)
*)
