
let pipe fs = let f a x = 3 + a in let base y = y in List.fold_left f base fs;;



let pipe fs = let f a x = a in let base y = y in List.fold_left f base fs;;


(* changed spans
(2,27)-(2,30)
*)

(* type error slice
(2,54)-(2,78)
*)
