
let identity a = a;;

let pipe fs =
  let f a x x = x a in let base = identity in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base m = m in List.fold_left f base fs;;

*)

(* changed spans
(2,13)-(2,18)
(2,17)-(2,18)
(5,2)-(5,70)
(5,12)-(5,19)
(5,18)-(5,19)
(5,23)-(5,70)
(5,34)-(5,42)
(5,46)-(5,70)
*)

(* type error slice
(5,2)-(5,70)
(5,8)-(5,19)
(5,10)-(5,19)
(5,12)-(5,19)
(5,16)-(5,17)
(5,16)-(5,19)
(5,18)-(5,19)
(5,46)-(5,60)
(5,46)-(5,70)
(5,61)-(5,62)
*)
