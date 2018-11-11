
let pipe fs = let f a x y x = a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,31)
x (a y)
AppG [AppG [EmptyG]]

(2,30)-(2,31)
x
VarG

(2,30)-(2,31)
a y
AppG [VarG]

(2,35)-(2,77)
y
VarG

*)
