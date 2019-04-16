
let pipe fs = let f a x = x a in let base = 0 (+) in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base = (+) 0 in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,30)
x
VarG

(2,45)-(2,50)
(+) 0
AppG (fromList [LitG])

*)

(* type error slice
(2,45)-(2,46)
(2,45)-(2,50)
*)
