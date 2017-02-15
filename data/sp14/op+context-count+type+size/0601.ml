
let sqsum xs = let f a x = x ** 2 in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = x * x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(2,27)-(2,33)
(2,29)-(2,31)
(2,32)-(2,33)
(2,37)-(2,77)
(2,48)-(2,49)
*)

(* type error slice
(2,27)-(2,33)
(2,29)-(2,31)
(2,32)-(2,33)
*)
