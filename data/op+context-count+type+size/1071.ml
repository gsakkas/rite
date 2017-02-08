
let pipe fs = let f a x = x a in let base = fs fs in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base q = q in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,30)
(2,29)-(2,30)
(2,34)-(2,78)
(2,45)-(2,47)
(2,45)-(2,50)
(2,48)-(2,50)
(2,54)-(2,78)
*)

(* type error slice
(2,45)-(2,47)
(2,45)-(2,50)
(2,48)-(2,50)
*)
