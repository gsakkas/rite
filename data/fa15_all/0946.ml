
let pipe fs = let f a x x = x a in let base z = z in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x q = x q in let base z = z in List.fold_left f base fs;;

*)

(* changed spans
(2,25)-(2,32)
fun q -> x q
LamG VarPatG (AppG [EmptyG])

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
