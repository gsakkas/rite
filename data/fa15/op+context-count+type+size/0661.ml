
let pipe fs = let f a x = x x a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,27)
(2,26)-(2,31)
(2,28)-(2,29)
(2,35)-(2,77)
*)

(* type error slice
(2,26)-(2,27)
(2,26)-(2,31)
(2,28)-(2,29)
*)
