
let pipe fs =
  let f a x r s = a in let base r s = 0 in List.fold_left f base fs;;



let pipe fs = let f a x x = x in let base y = y in List.fold_left f base fs;;


(* changed spans
(3,13)-(3,16)
(3,19)-(3,20)
(3,33)-(3,36)
(3,39)-(3,40)
*)

(* type error slice
(3,44)-(3,68)
*)
