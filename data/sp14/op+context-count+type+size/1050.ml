
let pipe fs =
  let f a x = a x in let base x y = x y in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x y = x y in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(3,67)
(3,14)-(3,15)
(3,14)-(3,17)
(3,21)-(3,67)
*)

(* type error slice
(3,2)-(3,67)
(3,8)-(3,17)
(3,10)-(3,17)
(3,14)-(3,15)
(3,14)-(3,17)
(3,43)-(3,57)
(3,43)-(3,67)
(3,58)-(3,59)
*)
