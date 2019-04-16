
let pipe fs = let f a x = x a in let base = 0 (+) in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x p = x (a p) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,30)
fun p -> x (a p)
LamG VarPatG (AppG (fromList [EmptyG]))

(2,45)-(2,50)
fun x -> x
LamG VarPatG VarG

*)

(* type error slice
(2,45)-(2,46)
(2,45)-(2,50)
*)
