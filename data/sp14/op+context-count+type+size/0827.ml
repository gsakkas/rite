
let pipe fs =
  let f a x = a (x a) in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x z = x (a z) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,15)
(3,14)-(3,21)
(3,19)-(3,20)
(3,25)-(3,67)
(3,34)-(3,39)
*)

(* type error slice
(3,2)-(3,67)
(3,8)-(3,21)
(3,10)-(3,21)
(3,14)-(3,15)
(3,14)-(3,21)
(3,43)-(3,57)
(3,43)-(3,67)
(3,58)-(3,59)
*)
