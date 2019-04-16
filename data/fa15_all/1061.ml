
let pipe fs = let f a x = x x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,30)
a
VarG

*)

(* type error slice
(2,27)-(2,28)
(2,27)-(2,30)
(2,29)-(2,30)
*)
