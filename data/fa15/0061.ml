
let pipe fs =
  let f a x = x a "to be implemented" in
  let base = 0 "to be implemented" in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,38)
x
VarG

(4,14)-(4,35)
fun b -> b
LamG VarPatG VarG

*)

(* type error slice
(4,14)-(4,15)
(4,14)-(4,35)
*)
