
let pipe fs = let f a x = a a x in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,31)
(2,28)-(2,29)
(2,30)-(2,31)
(2,35)-(2,75)
(2,46)-(2,47)
*)

(* type error slice
(2,26)-(2,27)
(2,26)-(2,31)
(2,28)-(2,29)
*)
