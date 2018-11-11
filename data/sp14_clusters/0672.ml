
let pipe fs = let f a x a = x x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,31)
fun x -> fun a -> x a
LamG (LamG EmptyG)

(2,30)-(2,31)
a
VarG

*)
