
let pipe fs = let f a x = a + x in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,32)
x
VarG

(2,47)-(2,49)
fun x -> x
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
