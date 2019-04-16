
let pipe fs =
  let f a x a = x a in let base a = fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x a = x a in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(3,33)-(3,39)
fun fs -> fs
LamG VarPatG VarG

*)

(* type error slice
(3,3)-(3,67)
(3,9)-(3,20)
(3,11)-(3,20)
(3,13)-(3,20)
(3,17)-(3,18)
(3,17)-(3,20)
(3,24)-(3,67)
(3,33)-(3,39)
(3,37)-(3,39)
(3,43)-(3,57)
(3,43)-(3,67)
(3,58)-(3,59)
(3,60)-(3,64)
(3,65)-(3,67)
*)
