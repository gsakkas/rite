
let pipe fs = let f a x = x a in let base = f = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,27)
(2,26)-(2,29)
(2,33)-(2,77)
(2,44)-(2,45)
(2,44)-(2,49)
(2,48)-(2,49)
*)

(* type error slice
(2,14)-(2,77)
(2,20)-(2,29)
(2,44)-(2,45)
(2,44)-(2,49)
(2,44)-(2,49)
(2,48)-(2,49)
*)
