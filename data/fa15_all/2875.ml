
let pipe fs = let f a x = x in let base y = y in List.fold_right f base fs;;


(* fix

let pipe fs = let f a x = x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,50)-(2,75)
List.fold_left f base fs
AppG [VarG,VarG,VarG]

*)

(* type error slice
(2,32)-(2,75)
(2,41)-(2,46)
(2,50)-(2,65)
(2,50)-(2,75)
(2,68)-(2,72)
*)
