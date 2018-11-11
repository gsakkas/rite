
let pipe fs = let f a x = x a in let base = fs in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base = (+) 0 in List.fold_left f base fs;;

*)

(* changed spans
(2,44)-(2,46)
(+) 0
AppG [LitG]

(2,50)-(2,74)
(+)
VarG

(2,50)-(2,74)
0
LitG

*)
