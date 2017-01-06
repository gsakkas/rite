
let pipe fs = let f a x = a x in let base a = a in List.fold_left f base fs;;



let pipe fs = let f a x = a in let base a = a in List.fold_left f base fs;;


(* changed spans
(2,29)-(2,30)
*)

(* type error slice
(2,52)-(2,76)
*)
