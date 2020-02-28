
let sqsum xs = let f a x = (+) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = a in let base = f 2 xs in List.fold_left f base xs;;

*)

(* changed spans
(2,28)-(2,31)
a
VarG

(2,46)-(2,47)
f 2 xs
AppG [LitG,VarG]

*)

(* type error slice
(2,16)-(2,75)
(2,22)-(2,31)
(2,24)-(2,31)
(2,28)-(2,31)
(2,35)-(2,75)
(2,46)-(2,47)
(2,51)-(2,65)
(2,51)-(2,75)
(2,66)-(2,67)
(2,68)-(2,72)
*)
