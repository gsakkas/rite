
let pipe fs = let f a x = x a in let base = f fs in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base = f in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
(2,28)-(2,29)
(2,33)-(2,76)
(2,44)-(2,48)
(2,46)-(2,48)
*)

(* type error slice
(2,33)-(2,76)
(2,44)-(2,45)
(2,44)-(2,48)
(2,52)-(2,66)
(2,52)-(2,76)
(2,67)-(2,68)
(2,69)-(2,73)
*)
