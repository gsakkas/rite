
let pipe fs =
  let f a x = let existing = a in let next = x in existing next in
  let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,64)
fun a -> fun x -> x
LamG VarPatG (LamG VarPatG EmptyG)

*)

(* type error slice
(3,3)-(4,45)
(3,9)-(3,64)
(3,11)-(3,64)
(3,15)-(3,64)
(3,30)-(3,31)
(3,35)-(3,64)
(3,51)-(3,59)
(3,51)-(3,64)
(4,21)-(4,35)
(4,21)-(4,45)
(4,36)-(4,37)
*)
