
let pipe fs = let f a x = fs a in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,14)-(2,74)
(2,26)-(2,28)
(2,26)-(2,30)
(2,29)-(2,30)
(2,34)-(2,74)
(2,45)-(2,46)
(2,50)-(2,74)
*)

(* type error slice
(2,26)-(2,28)
(2,26)-(2,30)
(2,50)-(2,64)
(2,50)-(2,74)
(2,72)-(2,74)
*)
