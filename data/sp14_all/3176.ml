
let pipe fs = let f a x = () in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,29)
x
VarG

*)

(* type error slice
(2,15)-(2,75)
(2,21)-(2,29)
(2,23)-(2,29)
(2,27)-(2,29)
(2,33)-(2,75)
(2,42)-(2,47)
(2,51)-(2,65)
(2,51)-(2,75)
(2,66)-(2,67)
(2,68)-(2,72)
*)
