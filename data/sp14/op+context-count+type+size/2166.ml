
let sqsum xs = let f a x = () in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = a * a in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(2,27)-(2,29)
(2,33)-(2,73)
(2,44)-(2,45)
*)

(* type error slice
(2,15)-(2,73)
(2,21)-(2,29)
(2,23)-(2,29)
(2,27)-(2,29)
(2,33)-(2,73)
(2,44)-(2,45)
(2,49)-(2,63)
(2,49)-(2,73)
(2,64)-(2,65)
(2,66)-(2,70)
*)
