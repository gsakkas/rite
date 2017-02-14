
let pipe fs =
  let f a x x' = x' a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x' = a x' in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,17)-(3,19)
(3,20)-(3,21)
(3,25)-(3,67)
*)

(* type error slice
(3,2)-(3,67)
(3,8)-(3,21)
(3,10)-(3,21)
(3,12)-(3,21)
(3,17)-(3,19)
(3,17)-(3,21)
(3,20)-(3,21)
(3,43)-(3,57)
(3,43)-(3,67)
(3,58)-(3,59)
*)
