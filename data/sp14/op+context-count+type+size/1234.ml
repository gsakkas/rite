
let pipe fs =
  let f a x x' x a = x (a x') in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x' = x (a x') in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,29)
(3,18)-(3,29)
(3,34)-(3,76)
*)

(* type error slice
(3,3)-(3,76)
(3,9)-(3,29)
(3,11)-(3,29)
(3,13)-(3,29)
(3,16)-(3,29)
(3,18)-(3,29)
(3,25)-(3,26)
(3,25)-(3,29)
(3,27)-(3,29)
(3,34)-(3,76)
(3,43)-(3,48)
(3,47)-(3,48)
(3,52)-(3,66)
(3,52)-(3,76)
(3,67)-(3,68)
(3,69)-(3,73)
*)
