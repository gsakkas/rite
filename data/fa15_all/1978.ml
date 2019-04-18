
let pipe fs = let f a x = a + x in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x b = x b in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,32)
fun b -> x b
LamG VarPatG (AppG (fromList [EmptyG]))

(2,47)-(2,49)
fun b -> b
LamG VarPatG VarG

*)

(* type error slice
(2,15)-(2,77)
(2,21)-(2,32)
(2,27)-(2,28)
(2,27)-(2,32)
(2,36)-(2,77)
(2,47)-(2,49)
(2,53)-(2,67)
(2,53)-(2,77)
(2,68)-(2,69)
(2,70)-(2,74)
*)
