
let pipe fs =
  let f a x x' a = x (a x') in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x' = x (a x') in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,27)
(3,31)-(3,73)
*)

(* type error slice
(3,2)-(3,73)
(3,8)-(3,27)
(3,10)-(3,27)
(3,12)-(3,27)
(3,15)-(3,27)
(3,21)-(3,27)
(3,22)-(3,23)
(3,24)-(3,26)
(3,31)-(3,73)
(3,40)-(3,45)
(3,44)-(3,45)
(3,49)-(3,63)
(3,49)-(3,73)
(3,64)-(3,65)
(3,66)-(3,70)
*)

(* all spans
(2,9)-(3,73)
(3,2)-(3,73)
(3,8)-(3,27)
(3,10)-(3,27)
(3,12)-(3,27)
(3,15)-(3,27)
(3,19)-(3,27)
(3,19)-(3,20)
(3,21)-(3,27)
(3,22)-(3,23)
(3,24)-(3,26)
(3,31)-(3,73)
(3,40)-(3,45)
(3,44)-(3,45)
(3,49)-(3,73)
(3,49)-(3,63)
(3,64)-(3,65)
(3,66)-(3,70)
(3,71)-(3,73)
*)
