
let pipe fs = let f a x b = b a in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x b = a b in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(2,29)-(2,32)
a b
AppG [VarG]

*)

(* type error slice
(2,15)-(2,78)
(2,21)-(2,32)
(2,23)-(2,32)
(2,25)-(2,32)
(2,29)-(2,30)
(2,29)-(2,32)
(2,31)-(2,32)
(2,54)-(2,68)
(2,54)-(2,78)
(2,69)-(2,70)
*)
