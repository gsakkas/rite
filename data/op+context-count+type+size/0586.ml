
let sqsum xs = let f a x = (+) in let base = 0 in List.fold_left f base xs;;



let sqsum xs = let f a x = a in let base = f 2 xs in List.fold_left f base xs;;


(* changed spans
(2,28)-(2,31)
(2,46)-(2,47)
*)

(* type error slice
*)
