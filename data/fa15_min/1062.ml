
let pipe fs = let f a x = x fs in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,31)
a
VarG

*)

(* type error slice
(2,15)-(2,77)
(2,21)-(2,31)
(2,23)-(2,31)
(2,27)-(2,28)
(2,27)-(2,31)
(2,29)-(2,31)
(2,53)-(2,67)
(2,53)-(2,77)
(2,68)-(2,69)
(2,75)-(2,77)
*)
