
let pipe fs =
  let f a x y = x (a y) in let base = fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(3,39)-(3,41)
fun fs -> fs
LamG VarPatG VarG

*)

(* type error slice
(3,3)-(3,69)
(3,9)-(3,24)
(3,19)-(3,24)
(3,20)-(3,21)
(3,28)-(3,69)
(3,39)-(3,41)
(3,45)-(3,59)
(3,45)-(3,69)
(3,60)-(3,61)
(3,62)-(3,66)
(3,67)-(3,69)
*)
