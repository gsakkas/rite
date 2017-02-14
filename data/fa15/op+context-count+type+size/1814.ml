
let pipe fs =
  let f a x = a fs in let base fs = fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,15)
(3,14)-(3,18)
(3,16)-(3,18)
(3,22)-(3,66)
*)

(* type error slice
(3,2)-(3,66)
(3,8)-(3,18)
(3,10)-(3,18)
(3,14)-(3,15)
(3,14)-(3,18)
(3,42)-(3,56)
(3,42)-(3,66)
(3,57)-(3,58)
*)
