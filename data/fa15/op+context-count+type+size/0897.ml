
let pipe fs =
  let f a x result n = x (a n) in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x n = x (a n) in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,30)
(3,34)-(3,74)
(3,45)-(3,46)
*)

(* type error slice
(3,2)-(3,74)
(3,8)-(3,30)
(3,25)-(3,30)
(3,26)-(3,27)
(3,34)-(3,74)
(3,45)-(3,46)
(3,50)-(3,64)
(3,50)-(3,74)
(3,65)-(3,66)
(3,67)-(3,71)
*)
