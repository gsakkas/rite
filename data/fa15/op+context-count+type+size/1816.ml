
let pipe fs =
  let f a x = a fs in let base fs = fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,16)
(3,15)-(3,19)
(3,17)-(3,19)
(3,23)-(3,67)
*)

(* type error slice
(3,3)-(3,67)
(3,9)-(3,19)
(3,11)-(3,19)
(3,15)-(3,16)
(3,15)-(3,19)
(3,43)-(3,57)
(3,43)-(3,67)
(3,58)-(3,59)
*)
