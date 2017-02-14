
let pipe fs = let f a x = x a in let base = fs fs in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base q = q in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
(2,28)-(2,29)
(2,33)-(2,77)
(2,44)-(2,46)
(2,44)-(2,49)
(2,47)-(2,49)
(2,53)-(2,77)
*)

(* type error slice
(2,44)-(2,46)
(2,44)-(2,49)
(2,47)-(2,49)
*)
