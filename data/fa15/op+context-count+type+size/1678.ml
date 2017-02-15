
let pipe fs =
  let f a x y = x (a y) in let base = fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(3,38)-(3,40)
*)

(* type error slice
(3,2)-(3,68)
(3,8)-(3,23)
(3,18)-(3,23)
(3,19)-(3,20)
(3,27)-(3,68)
(3,38)-(3,40)
(3,44)-(3,58)
(3,44)-(3,68)
(3,59)-(3,60)
(3,61)-(3,65)
(3,66)-(3,68)
*)
