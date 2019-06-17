
let pipe fs =
  let f a x y = y (a y) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,17)-(3,24)
x (a y)
AppG [AppG [EmptyG]]

*)

(* type error slice
(3,3)-(3,70)
(3,9)-(3,24)
(3,17)-(3,18)
(3,17)-(3,24)
(3,19)-(3,24)
(3,20)-(3,21)
(3,22)-(3,23)
(3,28)-(3,70)
(3,37)-(3,42)
(3,41)-(3,42)
(3,46)-(3,60)
(3,46)-(3,70)
(3,61)-(3,62)
(3,63)-(3,67)
*)
