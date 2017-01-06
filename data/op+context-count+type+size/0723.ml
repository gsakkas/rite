
let pipe fs = let f a x x = x a in let base b = b in List.fold_left f base fs;;



let pipe fs = let f a x c = x c in let base b = b in List.fold_left f base fs;;


(* changed spans
(2,25)-(2,26)
(2,31)-(2,32)
*)

(* type error slice
(2,54)-(2,78)
*)
