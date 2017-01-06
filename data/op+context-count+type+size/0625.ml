
let pipe fs = let f a x = a x in let base = 0 in List.fold_left f base fs;;



let pipe fs = let f a x x = a x in let base x = x in List.fold_left f base fs;;


(* changed spans
(2,45)-(2,46)
*)

(* type error slice
(2,50)-(2,74)
*)
