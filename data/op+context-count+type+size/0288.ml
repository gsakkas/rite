
let pipe fs = let f a x y = a in let base y = y in List.fold_left f base fs;;



let pipe fs y = let f a x = x a in let base = y in List.fold_left f base fs;;


(* changed spans
(2,25)-(2,26)
(2,43)-(2,44)
*)

(* type error slice
(2,52)-(2,76)
*)
