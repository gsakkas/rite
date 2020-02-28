
let pipe fs =
  let f a x p' = a in let base a' = a' in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base p = p in List.fold_left f base fs;;

*)

(* changed spans
(3,13)-(3,19)
a
VarG

(3,32)-(3,39)
fun p -> p
LamG VarPatG VarG

*)

(* type error slice
(3,3)-(3,67)
(3,9)-(3,19)
(3,11)-(3,19)
(3,13)-(3,19)
(3,18)-(3,19)
(3,43)-(3,57)
(3,43)-(3,67)
(3,58)-(3,59)
*)
