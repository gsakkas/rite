
let pipe fs =
  let f a x x = x a in let base x1 = x1 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x a = x a in let base x1 = x1 in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,19)
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

(* all spans
(2,9)-(3,67)
(3,2)-(3,67)
(3,8)-(3,19)
(3,10)-(3,19)
(3,12)-(3,19)
(3,16)-(3,19)
(3,16)-(3,17)
(3,18)-(3,19)
(3,23)-(3,67)
(3,32)-(3,39)
(3,37)-(3,39)
(3,43)-(3,67)
(3,43)-(3,57)
(3,58)-(3,59)
(3,60)-(3,64)
(3,65)-(3,67)
*)
