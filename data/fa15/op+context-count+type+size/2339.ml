
let identity a = a;;

let pipe fs =
  let f a x x = x a in let base = identity in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base m = m in List.fold_left f base fs;;

*)

(* changed spans
(2,14)-(2,19)
(2,18)-(2,19)
(5,3)-(5,71)
(5,13)-(5,20)
(5,19)-(5,20)
(5,24)-(5,71)
(5,35)-(5,43)
(5,47)-(5,71)
*)

(* type error slice
(5,3)-(5,71)
(5,9)-(5,20)
(5,11)-(5,20)
(5,13)-(5,20)
(5,17)-(5,18)
(5,17)-(5,20)
(5,19)-(5,20)
(5,47)-(5,61)
(5,47)-(5,71)
(5,62)-(5,63)
*)
