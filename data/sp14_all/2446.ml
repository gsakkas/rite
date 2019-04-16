
let pipe fs = let f a x = x a in let base = fs 3 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x p = x (a p) in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,30)
fun p -> x (a p)
LamG VarPatG (AppG (fromList [EmptyG]))

(2,45)-(2,49)
fun b -> b
LamG VarPatG VarG

*)

(* type error slice
(2,45)-(2,47)
(2,45)-(2,49)
(2,53)-(2,67)
(2,53)-(2,77)
(2,75)-(2,77)
*)
