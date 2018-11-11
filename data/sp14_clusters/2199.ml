
let pipe fs = let f a x j x = a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x j = x (a j) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,31)
x (a j)
AppG [AppG [EmptyG]]

(2,30)-(2,31)
x
VarG

(2,30)-(2,31)
a j
AppG [VarG]

(2,35)-(2,77)
j
VarG

*)
