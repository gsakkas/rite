
let pipe fs = let f a x = a x in let base a' = a' in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base p = p in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,30)
(2,29)-(2,30)
(2,34)-(2,78)
(2,43)-(2,50)
(2,48)-(2,50)
(2,54)-(2,78)
*)

(* type error slice
(2,15)-(2,78)
(2,21)-(2,30)
(2,23)-(2,30)
(2,27)-(2,28)
(2,27)-(2,30)
(2,54)-(2,68)
(2,54)-(2,78)
(2,69)-(2,70)
*)
