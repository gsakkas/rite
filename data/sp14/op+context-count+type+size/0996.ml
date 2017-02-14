
let pipe fs = let f a x = a x in let base g x = x in List.fold_left f base fs;;


(* fix

let y x = x + 1;;

let q x = y x;;

let pipe fs =
  let f a x el = x (a q) in let base g q = q in List.fold_left f base fs;;

*)

(* changed spans
(2,9)-(2,77)
(2,14)-(2,77)
(2,20)-(2,29)
(2,26)-(2,27)
(2,26)-(2,29)
(2,33)-(2,77)
(2,42)-(2,49)
(2,44)-(2,49)
(2,48)-(2,49)
(2,53)-(2,67)
(2,53)-(2,77)
(2,68)-(2,69)
(2,70)-(2,74)
(2,75)-(2,77)
*)

(* type error slice
(2,14)-(2,77)
(2,20)-(2,29)
(2,22)-(2,29)
(2,26)-(2,27)
(2,26)-(2,29)
(2,53)-(2,67)
(2,53)-(2,77)
(2,68)-(2,69)
*)
