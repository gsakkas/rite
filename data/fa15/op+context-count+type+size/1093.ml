
let pipe fs = let f a x = a :: x in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x b = x b in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,28)
(2,27)-(2,33)
(2,32)-(2,33)
(2,37)-(2,78)
(2,48)-(2,50)
(2,54)-(2,78)
*)

(* type error slice
(2,15)-(2,78)
(2,21)-(2,33)
(2,23)-(2,33)
(2,27)-(2,28)
(2,27)-(2,33)
(2,27)-(2,33)
(2,54)-(2,68)
(2,54)-(2,78)
(2,69)-(2,70)
*)
