
let identity a = a;;

let pipe fs =
  let f a x = a x in let base = identity in List.fold_left f base fs;;


(* fix

let identity a = a;;

let pipe fs =
  let f a x = a in let base = identity in List.fold_left f base fs;;

*)

(* changed spans
(5,15)-(5,18)
a
VarG

*)

(* type error slice
(5,3)-(5,69)
(5,9)-(5,18)
(5,11)-(5,18)
(5,15)-(5,16)
(5,15)-(5,18)
(5,45)-(5,59)
(5,45)-(5,69)
(5,60)-(5,61)
*)
