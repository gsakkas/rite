
let pipe fs =
  let f a x = List.map x in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,25)
fun x -> x
LamG VarPatG VarG

(3,40)-(3,41)
fun x -> x
LamG VarPatG VarG

*)

(* type error slice
(3,3)-(3,69)
(3,9)-(3,25)
(3,11)-(3,25)
(3,15)-(3,23)
(3,15)-(3,25)
(3,29)-(3,69)
(3,40)-(3,41)
(3,45)-(3,59)
(3,45)-(3,69)
(3,60)-(3,61)
(3,62)-(3,66)
*)
