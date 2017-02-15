
let pipe fs = let f a x = x x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,27)
(2,26)-(2,29)
(2,28)-(2,29)
(2,33)-(2,75)
(2,42)-(2,47)
*)

(* type error slice
(2,26)-(2,27)
(2,26)-(2,29)
(2,28)-(2,29)
*)
