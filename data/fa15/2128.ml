
let pipe fs =
  let f a x = x a in let base = List.hd fs in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,18)
x
VarG

(3,33)-(3,43)
fun x -> x
LamG VarPatG VarG

*)

(* type error slice
(3,3)-(3,71)
(3,9)-(3,18)
(3,11)-(3,18)
(3,15)-(3,16)
(3,15)-(3,18)
(3,22)-(3,71)
(3,33)-(3,40)
(3,33)-(3,43)
(3,41)-(3,43)
(3,47)-(3,61)
(3,47)-(3,71)
(3,62)-(3,63)
(3,64)-(3,68)
(3,69)-(3,71)
*)
