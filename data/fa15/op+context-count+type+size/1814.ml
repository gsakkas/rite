
let pipe fs n = let f a x = a n in let base = n in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(2,13)-(2,76)
(2,17)-(2,76)
(2,29)-(2,32)
(2,31)-(2,32)
(2,36)-(2,76)
(2,47)-(2,48)
(2,52)-(2,76)
*)

(* type error slice
(2,17)-(2,76)
(2,23)-(2,32)
(2,25)-(2,32)
(2,29)-(2,30)
(2,29)-(2,32)
(2,52)-(2,66)
(2,52)-(2,76)
(2,67)-(2,68)
*)
