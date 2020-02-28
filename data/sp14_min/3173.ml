
let pipe fs = let f a x = a + x in let base = f in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,32)
x
VarG

(2,47)-(2,48)
fun x -> x
LamG VarPatG VarG

*)

(* type error slice
(2,36)-(2,76)
(2,47)-(2,48)
(2,52)-(2,66)
(2,52)-(2,76)
(2,67)-(2,68)
(2,69)-(2,73)
*)
