
let pipe fs = let f a x = a x in let base q = q in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base a = a in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,27)
(2,26)-(2,29)
(2,33)-(2,75)
(2,42)-(2,47)
(2,46)-(2,47)
(2,51)-(2,75)
*)

(* type error slice
(2,14)-(2,75)
(2,20)-(2,29)
(2,22)-(2,29)
(2,26)-(2,27)
(2,26)-(2,29)
(2,51)-(2,65)
(2,51)-(2,75)
(2,66)-(2,67)
*)
