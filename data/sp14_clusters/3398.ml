
let sqsum xs = let f a x = a * a in let base = [] in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = a * a in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(2,47)-(2,49)
0
LitG

*)
