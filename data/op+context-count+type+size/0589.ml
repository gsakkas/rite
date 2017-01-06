
let sqsum xs = let f a x = a ** 2 in let base = a in List.fold_left f base xs;;



let sqsum xs = let f a x = a in let base = f 2 xs in List.fold_left f base xs;;


(* changed spans
(2,30)-(2,34)
(2,49)-(2,50)
*)

(* type error slice
*)
