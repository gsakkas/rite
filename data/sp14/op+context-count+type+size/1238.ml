
let pipe fs =
  let f a x = x in let base p = p in List.fold_left f base List.rev fs;;


(* fix

let pipe fs =
  let f a x = x in let base p = p in List.fold_left f base (List.rev fs);;

*)

(* changed spans
(3,37)-(3,70)
(3,59)-(3,67)
*)

(* type error slice
(3,37)-(3,51)
(3,37)-(3,70)
(3,59)-(3,67)
*)

(* all spans
(2,9)-(3,70)
(3,2)-(3,70)
(3,8)-(3,15)
(3,10)-(3,15)
(3,14)-(3,15)
(3,19)-(3,70)
(3,28)-(3,33)
(3,32)-(3,33)
(3,37)-(3,70)
(3,37)-(3,51)
(3,52)-(3,53)
(3,54)-(3,58)
(3,59)-(3,67)
(3,68)-(3,70)
*)
