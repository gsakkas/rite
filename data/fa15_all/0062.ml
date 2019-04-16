
let pipe fs = let f a x = a x in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,30)
a
VarG

*)

(* type error slice
(2,15)-(2,76)
(2,21)-(2,30)
(2,23)-(2,30)
(2,27)-(2,28)
(2,27)-(2,30)
(2,52)-(2,66)
(2,52)-(2,76)
(2,67)-(2,68)
*)
