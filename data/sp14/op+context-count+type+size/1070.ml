
let pipe fs = let f a x = x fs in let base = fs in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base q = q in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,30)
(2,28)-(2,30)
(2,34)-(2,75)
(2,45)-(2,47)
(2,51)-(2,75)
*)

(* type error slice
(2,14)-(2,75)
(2,20)-(2,30)
(2,22)-(2,30)
(2,26)-(2,27)
(2,26)-(2,30)
(2,34)-(2,75)
(2,45)-(2,47)
(2,51)-(2,65)
(2,51)-(2,75)
(2,66)-(2,67)
(2,68)-(2,72)
(2,73)-(2,75)
*)
