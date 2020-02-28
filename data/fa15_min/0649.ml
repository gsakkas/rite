
let pipe fs =
  let f a x g = x (a g) in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = x (a g) in let base k = k in List.fold_left f base fs;;

*)

(* changed spans
(3,39)-(3,41)
fun k -> k
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
*)
