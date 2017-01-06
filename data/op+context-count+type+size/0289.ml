
let pipe fs = let f a x y = y a in let base y = y in List.fold_left f base fs;;



let pipe fs y = let f a x = x a in let base = y in List.fold_left f base fs;;


(* changed spans
(2,25)-(2,26)
(2,29)-(2,30)
(2,45)-(2,46)
*)

(* type error slice
(2,54)-(2,78)
*)
