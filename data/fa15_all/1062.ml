
let pipe fs = let f a x = x fs in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,28)-(2,30)
a
VarG

*)
