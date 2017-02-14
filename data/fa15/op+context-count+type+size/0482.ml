
let pipe fs =
  let f a x mb x = a x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(3,68)
(3,12)-(3,22)
(3,15)-(3,22)
(3,19)-(3,20)
(3,19)-(3,22)
(3,26)-(3,68)
*)

(* type error slice
(3,2)-(3,68)
(3,8)-(3,22)
(3,10)-(3,22)
(3,12)-(3,22)
(3,15)-(3,22)
(3,19)-(3,20)
(3,19)-(3,22)
(3,44)-(3,58)
(3,44)-(3,68)
(3,59)-(3,60)
*)
