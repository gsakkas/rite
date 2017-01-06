
let pipe fs = let f a x _ = a in let base y = y in List.fold_left f base fs;;



let pipe fs = let f a x x = x in let base y = y in List.fold_left f base fs;;


(* changed spans
(2,25)-(2,26)
(2,29)-(2,30)
*)

(* type error slice
(2,52)-(2,76)
*)
