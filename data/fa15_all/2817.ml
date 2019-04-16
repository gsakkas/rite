
let pipe fs = let f a x x = x a in let base f = f in List.fold_left f base fs;;


(* fix

let f a x = x a;;

let f a = f;;

let pipe fs = let f a x x = f a in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(2,29)-(2,32)
f a
AppG (fromList [VarG])

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
