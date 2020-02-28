
let pipe fs =
  let f a x = match fs with | x::y -> x in
  let base = f in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,40)
x
VarG

(4,14)-(4,15)
fun y -> y
LamG VarPatG VarG

*)

(* type error slice
(4,3)-(4,43)
(4,14)-(4,15)
(4,19)-(4,33)
(4,19)-(4,43)
(4,34)-(4,35)
(4,36)-(4,40)
*)
