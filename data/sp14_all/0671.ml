
let pipe fs = let f a x x = x x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,29)-(2,32)
fun a -> x a
LamG VarPatG (AppG [EmptyG])

*)

(* type error slice
(2,29)-(2,30)
(2,29)-(2,32)
(2,31)-(2,32)
*)
