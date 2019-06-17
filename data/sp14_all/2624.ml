
let pipe fs =
  let f a x = (a x) x in let base = (+) 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base z = z in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,22)
fun y -> x (a y)
LamG VarPatG (AppG [EmptyG])

(3,37)-(3,42)
fun z -> z
LamG VarPatG VarG

*)

(* type error slice
(3,3)-(3,70)
(3,9)-(3,22)
(3,11)-(3,22)
(3,15)-(3,20)
(3,15)-(3,22)
(3,16)-(3,17)
(3,46)-(3,60)
(3,46)-(3,70)
(3,61)-(3,62)
*)
