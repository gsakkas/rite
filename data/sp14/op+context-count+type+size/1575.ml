
let pipe fs = let f a x c = a in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x c = x (let fn d = d in fn) in
  let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(2,14)-(2,75)
(2,28)-(2,29)
(2,33)-(2,75)
(2,42)-(2,47)
(2,51)-(2,65)
(2,66)-(2,67)
(2,68)-(2,72)
(2,73)-(2,75)
*)

(* type error slice
(2,14)-(2,75)
(2,20)-(2,29)
(2,22)-(2,29)
(2,24)-(2,29)
(2,28)-(2,29)
(2,51)-(2,65)
(2,51)-(2,75)
(2,66)-(2,67)
*)
