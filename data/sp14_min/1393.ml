
let pipe fs =
  let f a x f x = f (x a) in let base z = z in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x z = x (a z) in let base z = z in List.fold_left f base fs;;

*)

(* changed spans
(3,13)-(3,26)
fun z -> x (a z)
LamG VarPatG (AppG [EmptyG])

*)

(* type error slice
(3,3)-(3,72)
(3,9)-(3,26)
(3,11)-(3,26)
(3,13)-(3,26)
(3,15)-(3,26)
(3,21)-(3,26)
(3,22)-(3,23)
(3,24)-(3,25)
(3,48)-(3,62)
(3,48)-(3,72)
(3,63)-(3,64)
*)
