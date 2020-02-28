
let pipe fs =
  let f a x combine c = x (a c) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x c = x (a c) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,13)-(3,32)
fun c -> x (a c)
LamG VarPatG (AppG [EmptyG])

*)

(* type error slice
(3,3)-(3,78)
(3,9)-(3,32)
(3,11)-(3,32)
(3,13)-(3,32)
(3,21)-(3,32)
(3,27)-(3,32)
(3,28)-(3,29)
(3,30)-(3,31)
(3,36)-(3,78)
(3,45)-(3,50)
(3,49)-(3,50)
(3,54)-(3,68)
(3,54)-(3,78)
(3,69)-(3,70)
(3,71)-(3,75)
*)
