
let pipe fs =
  let f a x = (a, x) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,21)
fun y -> x (a y)
LamG VarPatG (AppG [EmptyG])

*)

(* type error slice
(3,3)-(3,67)
(3,9)-(3,21)
(3,11)-(3,21)
(3,15)-(3,21)
(3,16)-(3,17)
(3,43)-(3,57)
(3,43)-(3,67)
(3,58)-(3,59)
*)
