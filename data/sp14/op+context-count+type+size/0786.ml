
let pipe fs = let f a x = fs a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x y = y in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,28)
(2,26)-(2,30)
(2,29)-(2,30)
(2,34)-(2,76)
(2,43)-(2,48)
*)

(* type error slice
(2,26)-(2,28)
(2,26)-(2,30)
(2,52)-(2,66)
(2,52)-(2,76)
(2,74)-(2,76)
*)
