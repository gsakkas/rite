
let pipe fs =
  let f a x r s = a in let base r s = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x x = x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(3,67)
(3,12)-(3,19)
(3,14)-(3,19)
(3,18)-(3,19)
(3,23)-(3,67)
(3,32)-(3,39)
(3,34)-(3,39)
(3,38)-(3,39)
(3,43)-(3,67)
*)

(* type error slice
(3,2)-(3,67)
(3,8)-(3,19)
(3,10)-(3,19)
(3,12)-(3,19)
(3,14)-(3,19)
(3,18)-(3,19)
(3,43)-(3,57)
(3,43)-(3,67)
(3,58)-(3,59)
*)
