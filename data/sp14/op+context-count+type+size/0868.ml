
let pipe fs = let f a x = fs a x in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs y = let f a x = x a in let base = y in List.fold_left f base fs;;

*)

(* changed spans
(2,14)-(2,76)
(2,20)-(2,32)
(2,26)-(2,28)
(2,26)-(2,32)
(2,29)-(2,30)
(2,36)-(2,76)
(2,47)-(2,48)
(2,52)-(2,76)
*)

(* type error slice
(2,26)-(2,28)
(2,26)-(2,32)
(2,52)-(2,66)
(2,52)-(2,76)
(2,74)-(2,76)
*)
