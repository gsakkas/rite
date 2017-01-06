
let sqsum xs = let f a x = (+) in let base = 2 in List.fold_left f base xs;;



let sqsum xs = let f a x = a in let base = f 2 xs in List.fold_left f base xs;;


(* changed spans
(2,28)-(2,31)
*)

(* type error slice
*)
