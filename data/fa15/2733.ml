
let pipe fs = let f a x = x x in let base f = f in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
(2,28)-(2,29)
*)

(* type error slice
(2,26)-(2,27)
(2,26)-(2,29)
(2,28)-(2,29)
*)

(* all spans
(2,9)-(2,75)
(2,14)-(2,75)
(2,20)-(2,29)
(2,22)-(2,29)
(2,26)-(2,29)
(2,26)-(2,27)
(2,28)-(2,29)
(2,33)-(2,75)
(2,42)-(2,47)
(2,46)-(2,47)
(2,51)-(2,75)
(2,51)-(2,65)
(2,66)-(2,67)
(2,68)-(2,72)
(2,73)-(2,75)
*)
