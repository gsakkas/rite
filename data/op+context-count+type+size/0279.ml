
let pipe fs = let f a x _ = x a in let base = [] in List.fold_left f base fs;;



let pipe fs = let f a x x = x in let base y = y in List.fold_left f base fs;;


(* changed spans
(2,25)-(2,26)
(2,31)-(2,32)
(2,47)-(2,49)
*)

(* type error slice
(2,53)-(2,77)
*)
