
let pipe fs = let f a x = x @ a in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x b = x b in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,27)
(2,26)-(2,31)
(2,28)-(2,29)
(2,30)-(2,31)
(2,46)-(2,47)
(2,51)-(2,75)
*)

(* type error slice
(2,14)-(2,75)
(2,20)-(2,31)
(2,26)-(2,31)
(2,28)-(2,29)
(2,30)-(2,31)
(2,35)-(2,75)
(2,46)-(2,47)
(2,51)-(2,65)
(2,51)-(2,75)
(2,66)-(2,67)
(2,68)-(2,72)
*)
