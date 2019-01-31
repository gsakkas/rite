
let pipe fs = let f a x x = x a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,31)
fun a -> fun x -> x
LamG (LamG EmptyG)

*)
