
let pipe fs = let f a x = x a in let base = fs 3 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x p = x (a p) in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(2,14)-(2,76)
(2,26)-(2,29)
(2,28)-(2,29)
(2,33)-(2,76)
(2,44)-(2,46)
(2,47)-(2,48)
(2,52)-(2,76)
*)

(* type error slice
(2,44)-(2,46)
(2,44)-(2,48)
(2,52)-(2,66)
(2,52)-(2,76)
(2,74)-(2,76)
*)
