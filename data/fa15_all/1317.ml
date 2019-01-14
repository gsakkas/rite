
let pipe fs = let f a x x a = x a in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(2,48)-(2,49)
fun f -> 0
LamG LitG

*)
