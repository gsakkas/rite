
let pipe fs =
  let f a x r s = a in let base r s = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x x = x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,13)-(3,20)
fun x -> x
LamG VarPatG VarG

(3,33)-(3,40)
fun y -> y
LamG VarPatG VarG

*)

(* type error slice
(3,3)-(3,68)
(3,9)-(3,20)
(3,11)-(3,20)
(3,13)-(3,20)
(3,15)-(3,20)
(3,19)-(3,20)
(3,44)-(3,58)
(3,44)-(3,68)
(3,59)-(3,60)
*)
