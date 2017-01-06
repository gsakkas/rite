
let pipe fs = let f a x x = a in let base x = x in List.fold_left f base fs;;



let pipe fs = let f a x x = a x in let base x = x in List.fold_left f base fs;;


(* changed spans
*)

(* type error slice
(2,52)-(2,76)
*)
