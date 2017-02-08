
let pipe fs =
  let f a x = a (x a) in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x z = x (a z) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,16)
(3,15)-(3,21)
(3,20)-(3,21)
(3,26)-(3,68)
(3,35)-(3,40)
*)

(* type error slice
(3,3)-(3,68)
(3,9)-(3,21)
(3,11)-(3,21)
(3,15)-(3,16)
(3,15)-(3,21)
(3,44)-(3,58)
(3,44)-(3,68)
(3,59)-(3,60)
*)
