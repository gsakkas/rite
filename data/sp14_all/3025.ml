
let pipe fs = let f a x _ = x a in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x x = x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,25)-(2,32)
fun x -> x
LamG VarPatG VarG

(2,47)-(2,49)
fun y -> y
LamG VarPatG VarG

*)

(* type error slice
(2,15)-(2,77)
(2,21)-(2,32)
(2,23)-(2,32)
(2,25)-(2,32)
(2,36)-(2,77)
(2,47)-(2,49)
(2,53)-(2,67)
(2,53)-(2,77)
(2,68)-(2,69)
(2,70)-(2,74)
*)
