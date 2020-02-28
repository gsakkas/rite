
let pipe fs = let f a x = x x in let base f = f in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,30)
x
VarG

*)

(* type error slice
(2,27)-(2,28)
(2,27)-(2,30)
(2,29)-(2,30)
*)
