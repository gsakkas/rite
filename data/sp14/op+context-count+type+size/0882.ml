
let pipe fs = let f a x = fs a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x y = y in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,29)
(2,27)-(2,31)
(2,30)-(2,31)
(2,35)-(2,77)
(2,44)-(2,49)
*)

(* type error slice
(2,27)-(2,29)
(2,27)-(2,31)
(2,53)-(2,67)
(2,53)-(2,77)
(2,75)-(2,77)
*)
