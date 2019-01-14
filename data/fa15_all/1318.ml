
let pipe fs = let f a x = x a in let base = f = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(2,44)-(2,45)
fun f -> 0
LamG LitG

*)
