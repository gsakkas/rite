
let pipe fs = let f a x a x = a x in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x a x = a x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,14)-(2,77)
(2,37)-(2,77)
(2,48)-(2,49)
(2,53)-(2,77)
*)

(* type error slice
(2,14)-(2,77)
(2,20)-(2,33)
(2,22)-(2,33)
(2,24)-(2,33)
(2,37)-(2,77)
(2,48)-(2,49)
(2,53)-(2,67)
(2,53)-(2,77)
(2,68)-(2,69)
(2,70)-(2,74)
*)
