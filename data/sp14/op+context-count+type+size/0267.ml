
let pipe fs = let f a x y = a in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs y = let f a x = x a in let base = y in List.fold_left f base fs;;

*)

(* changed spans
(2,15)-(2,76)
(2,21)-(2,30)
(2,25)-(2,30)
(2,29)-(2,30)
(2,34)-(2,76)
(2,43)-(2,48)
*)

(* type error slice
(2,15)-(2,76)
(2,21)-(2,30)
(2,23)-(2,30)
(2,25)-(2,30)
(2,29)-(2,30)
(2,52)-(2,66)
(2,52)-(2,76)
(2,67)-(2,68)
*)
