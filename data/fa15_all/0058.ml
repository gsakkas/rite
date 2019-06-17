
let pipe fs =
  let f a x f' x a = x a in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x f' a x = x a in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,25)
fun a -> fun x -> x a
LamG VarPatG (LamG EmptyPatG EmptyG)

(3,40)-(3,41)
fun y -> y
LamG VarPatG VarG

*)

(* type error slice
(3,3)-(3,69)
(3,9)-(3,25)
(3,11)-(3,25)
(3,13)-(3,25)
(3,29)-(3,69)
(3,40)-(3,41)
(3,45)-(3,59)
(3,45)-(3,69)
(3,60)-(3,61)
(3,62)-(3,66)
*)
