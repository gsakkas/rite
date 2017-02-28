
let pipe fs =
  let f a x y c = x (a c) in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,25)
(3,23)-(3,24)
(3,29)-(3,71)
(3,38)-(3,43)
*)

(* type error slice
(3,2)-(3,71)
(3,8)-(3,25)
(3,10)-(3,25)
(3,12)-(3,25)
(3,14)-(3,25)
(3,20)-(3,25)
(3,21)-(3,22)
(3,23)-(3,24)
(3,29)-(3,71)
(3,38)-(3,43)
(3,42)-(3,43)
(3,47)-(3,61)
(3,47)-(3,71)
(3,62)-(3,63)
(3,64)-(3,68)
*)

(* all spans
(2,9)-(3,71)
(3,2)-(3,71)
(3,8)-(3,25)
(3,10)-(3,25)
(3,12)-(3,25)
(3,14)-(3,25)
(3,18)-(3,25)
(3,18)-(3,19)
(3,20)-(3,25)
(3,21)-(3,22)
(3,23)-(3,24)
(3,29)-(3,71)
(3,38)-(3,43)
(3,42)-(3,43)
(3,47)-(3,71)
(3,47)-(3,61)
(3,62)-(3,63)
(3,64)-(3,68)
(3,69)-(3,71)
*)
