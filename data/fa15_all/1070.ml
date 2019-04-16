
let pipe fs = let f a x = fs x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,31)
x
VarG

*)

(* type error slice
(2,27)-(2,29)
(2,27)-(2,31)
(2,53)-(2,67)
(2,53)-(2,77)
(2,75)-(2,77)
*)
