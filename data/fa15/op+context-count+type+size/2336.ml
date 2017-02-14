
let identity a = a;;

let pipe fs =
  let f a x = a x in let base = identity in List.fold_left f base fs;;


(* fix

let identity a = a;;

let pipe fs =
  let f a x = a in let base = identity in List.fold_left f base fs;;

*)

(* changed spans
(5,14)-(5,17)
(5,16)-(5,17)
(5,21)-(5,68)
*)

(* type error slice
(5,2)-(5,68)
(5,8)-(5,17)
(5,10)-(5,17)
(5,14)-(5,15)
(5,14)-(5,17)
(5,44)-(5,58)
(5,44)-(5,68)
(5,59)-(5,60)
*)
