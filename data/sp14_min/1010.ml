
let pipe fs =
  let f a x d x = a x in let base d = d in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = x a in let base d = d in List.fold_left f base fs;;

*)

(* changed spans
(3,13)-(3,22)
fun a -> x a
LamG VarPatG (AppG [EmptyG])

*)

(* type error slice
(3,3)-(3,68)
(3,9)-(3,22)
(3,11)-(3,22)
(3,13)-(3,22)
(3,15)-(3,22)
(3,19)-(3,20)
(3,19)-(3,22)
(3,44)-(3,58)
(3,44)-(3,68)
(3,59)-(3,60)
*)
