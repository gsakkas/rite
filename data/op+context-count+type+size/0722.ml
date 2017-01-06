
let pipe fs = let f a x = x a in let base = fs in List.fold_left f base fs;;



let pipe fs = let f a x = x in let base b = b in List.fold_left f base fs;;


(* changed spans
(2,29)-(2,30)
(2,45)-(2,47)
*)

(* type error slice
(2,51)-(2,75)
*)
