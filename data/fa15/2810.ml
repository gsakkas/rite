
let pipe fs = let f a x = x + a in let base f = f in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,32)
x
VarG

*)

(* type error slice
(2,15)-(2,78)
(2,21)-(2,32)
(2,27)-(2,32)
(2,31)-(2,32)
(2,36)-(2,78)
(2,45)-(2,50)
(2,54)-(2,68)
(2,54)-(2,78)
(2,69)-(2,70)
(2,71)-(2,75)
*)
