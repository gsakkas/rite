
let pipe fs = let f a x z = z a in let base y = y in List.fold_left f base fs;;



let pipe fs = let f a x z = a z in let base y = y in List.fold_left f base fs;;


(* changed spans
(2,29)-(2,30)
*)

(* type error slice
(2,54)-(2,78)
*)
