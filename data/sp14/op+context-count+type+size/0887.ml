
let pipe fs =
  let f a x = (a, x) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,17)
(3,16)-(3,20)
(3,19)-(3,20)
(3,25)-(3,67)
(3,34)-(3,39)
*)

(* type error slice
(3,3)-(3,67)
(3,9)-(3,20)
(3,11)-(3,20)
(3,16)-(3,17)
(3,16)-(3,20)
(3,43)-(3,57)
(3,43)-(3,67)
(3,58)-(3,59)
*)
