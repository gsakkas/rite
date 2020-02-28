
let pipe fs = let f a x = a x in let base g x = x in List.fold_left f base fs;;


(* fix

let y x = x + 1;;

let q x = y x;;

let pipe fs =
  let f a x el = x (a q) in let base g q = q in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,30)
fun el -> x (a q)
LamG VarPatG (AppG [EmptyG])

(2,45)-(2,50)
fun q -> q
LamG VarPatG VarG

*)

(* type error slice
(2,15)-(2,78)
(2,21)-(2,30)
(2,23)-(2,30)
(2,27)-(2,28)
(2,27)-(2,30)
(2,54)-(2,68)
(2,54)-(2,78)
(2,69)-(2,70)
*)
