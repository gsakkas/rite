
let pipe fs =
  let f a x x = x a in let base f = f fs in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x t u = u in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(3,68)
(3,12)-(3,19)
(3,16)-(3,19)
(3,18)-(3,19)
(3,23)-(3,68)
(3,32)-(3,40)
(3,36)-(3,37)
(3,36)-(3,40)
(3,38)-(3,40)
*)

(* type error slice
(3,2)-(3,68)
(3,8)-(3,19)
(3,10)-(3,19)
(3,12)-(3,19)
(3,16)-(3,17)
(3,16)-(3,19)
(3,18)-(3,19)
(3,44)-(3,58)
(3,44)-(3,68)
(3,59)-(3,60)
*)
