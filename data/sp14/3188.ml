
let pipe fs = let f a x = x x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,30)
fun y -> x (a y)
LamG VarPatG (AppG [EmptyG])

*)

(* type error slice
(2,27)-(2,28)
(2,27)-(2,30)
(2,29)-(2,30)
*)
