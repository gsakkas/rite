
let pipe fs =
  let f a x mb x = a x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,13)-(3,23)
x
VarG

*)

(* type error slice
(3,3)-(3,69)
(3,9)-(3,23)
(3,11)-(3,23)
(3,13)-(3,23)
(3,16)-(3,23)
(3,20)-(3,21)
(3,20)-(3,23)
(3,45)-(3,59)
(3,45)-(3,69)
(3,60)-(3,61)
*)
