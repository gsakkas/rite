
let pipe fs =
  let f a x x = x a in let base fs = fs in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = x a in let base a = a in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(3,67)
(3,12)-(3,19)
(3,23)-(3,67)
(3,32)-(3,39)
(3,37)-(3,39)
(3,43)-(3,67)
*)

(* type error slice
(3,2)-(3,67)
(3,8)-(3,19)
(3,10)-(3,19)
(3,12)-(3,19)
(3,16)-(3,17)
(3,16)-(3,19)
(3,18)-(3,19)
(3,43)-(3,57)
(3,43)-(3,67)
(3,58)-(3,59)
*)
