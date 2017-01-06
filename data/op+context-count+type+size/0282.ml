
let pipe fs = let f a x = a x in let base n = n in List.fold_left f base fs;;



let pipe fs = let f a x x = x in let base y = y in List.fold_left f base fs;;


(* changed spans
(2,27)-(2,28)
(2,43)-(2,44)
(2,47)-(2,48)
*)

(* type error slice
(2,52)-(2,76)
*)
