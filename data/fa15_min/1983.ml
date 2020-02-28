
let pipe fs = let f a x b = b x in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x b = b in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(2,29)-(2,32)
b
VarG

*)

(* type error slice
(2,15)-(2,78)
(2,21)-(2,32)
(2,23)-(2,32)
(2,25)-(2,32)
(2,29)-(2,30)
(2,29)-(2,32)
(2,36)-(2,78)
(2,45)-(2,50)
(2,49)-(2,50)
(2,54)-(2,68)
(2,54)-(2,78)
(2,69)-(2,70)
(2,71)-(2,75)
*)
