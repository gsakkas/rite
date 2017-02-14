
let pipe fs =
  let f a x p = p a x in let base z = z in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x q = x q in let base z = z in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(3,67)
(3,12)-(3,21)
(3,16)-(3,17)
(3,16)-(3,21)
(3,18)-(3,19)
(3,20)-(3,21)
(3,25)-(3,67)
(3,34)-(3,39)
*)

(* type error slice
(3,2)-(3,67)
(3,8)-(3,21)
(3,10)-(3,21)
(3,12)-(3,21)
(3,16)-(3,17)
(3,16)-(3,21)
(3,18)-(3,19)
(3,43)-(3,57)
(3,43)-(3,67)
(3,58)-(3,59)
*)
