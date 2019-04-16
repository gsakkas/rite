
let x l = List.map string_of_int;;

let pipe fs = let f a x = a x in let base f = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base f x = x in List.fold_left f base fs;;

*)

(* changed spans
(4,27)-(4,30)
x
VarG

(4,47)-(4,48)
fun x -> x
LamG VarPatG VarG

*)

(* type error slice
(4,15)-(4,76)
(4,21)-(4,30)
(4,23)-(4,30)
(4,27)-(4,28)
(4,27)-(4,30)
(4,52)-(4,66)
(4,52)-(4,76)
(4,67)-(4,68)
*)
