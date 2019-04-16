
let pipe fs =
  let f a x p = p a x in let base z = z in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x q = x q in let base z = z in List.fold_left f base fs;;

*)

(* changed spans
(3,13)-(3,22)
fun q -> x q
LamG VarPatG (AppG (fromList [EmptyG]))

*)

(* type error slice
(3,3)-(3,68)
(3,9)-(3,22)
(3,11)-(3,22)
(3,13)-(3,22)
(3,17)-(3,18)
(3,17)-(3,22)
(3,19)-(3,20)
(3,44)-(3,58)
(3,44)-(3,68)
(3,59)-(3,60)
*)
