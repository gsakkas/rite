
let x _ f = f;;

let pipe fs = let f a x = a x in let base = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,6)-(2,13)
(2,8)-(2,13)
(2,12)-(2,13)
(4,14)-(4,73)
(4,26)-(4,27)
(4,26)-(4,29)
(4,33)-(4,73)
(4,44)-(4,45)
*)

(* type error slice
(4,14)-(4,73)
(4,20)-(4,29)
(4,22)-(4,29)
(4,26)-(4,27)
(4,26)-(4,29)
(4,49)-(4,63)
(4,49)-(4,73)
(4,64)-(4,65)
*)
