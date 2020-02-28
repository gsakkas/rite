
let pipe fs =
  let f a x = (a x) + x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x y = y in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,24)
fun y -> y
LamG VarPatG VarG

*)

(* type error slice
(3,3)-(3,70)
(3,9)-(3,24)
(3,11)-(3,24)
(3,15)-(3,20)
(3,15)-(3,24)
(3,16)-(3,17)
(3,46)-(3,60)
(3,46)-(3,70)
(3,61)-(3,62)
*)
