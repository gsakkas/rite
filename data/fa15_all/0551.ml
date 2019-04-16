
let pipe fs =
  let f a x = a + (x fs) in let base fs = fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,25)
fun x -> fun a -> x a
LamG VarPatG (LamG VarPatG EmptyG)

*)

(* type error slice
(3,3)-(3,73)
(3,9)-(3,25)
(3,15)-(3,16)
(3,15)-(3,25)
(3,29)-(3,73)
(3,38)-(3,45)
(3,49)-(3,63)
(3,49)-(3,73)
(3,64)-(3,65)
(3,66)-(3,70)
*)
