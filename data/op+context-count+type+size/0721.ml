
let sqsum xs = let f a x = x ** 2 in let base = 0 in List.fold_left f base xs;;



let sqsum xs = let f a x = x * x in let base = 0 in List.fold_left f base xs;;


(* changed spans
(2,30)-(2,34)
*)

(* type error slice
(2,28)-(2,34)
*)
