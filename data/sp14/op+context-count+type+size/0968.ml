
let pipe fs =
  let f a x = a = (x a) in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,15)
(3,14)-(3,23)
(3,21)-(3,22)
(3,27)-(3,67)
(3,38)-(3,39)
(3,43)-(3,67)
*)

(* type error slice
(3,2)-(3,67)
(3,8)-(3,23)
(3,10)-(3,23)
(3,14)-(3,23)
(3,27)-(3,67)
(3,38)-(3,39)
(3,43)-(3,57)
(3,43)-(3,67)
(3,58)-(3,59)
(3,60)-(3,64)
*)
