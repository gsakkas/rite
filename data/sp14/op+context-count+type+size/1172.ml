
let pipe fs =
  let f a x = a x in let base x y = x y in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x y = x y in List.fold_left f base fs;;

*)

(* changed spans
(3,3)-(3,68)
(3,15)-(3,16)
(3,15)-(3,18)
(3,22)-(3,68)
*)

(* type error slice
(3,3)-(3,68)
(3,9)-(3,18)
(3,11)-(3,18)
(3,15)-(3,16)
(3,15)-(3,18)
(3,44)-(3,58)
(3,44)-(3,68)
(3,59)-(3,60)
*)
