
let pipe fs = let f a x = a x in let base = f in List.fold_left f base fs;;


(* fix

let x l = List.map string_of_int;;

let pipe fs = let f a x = a in let base = x in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,30)
a
VarG

(2,45)-(2,46)
x
VarG

*)

(* type error slice
(2,15)-(2,74)
(2,21)-(2,30)
(2,23)-(2,30)
(2,27)-(2,28)
(2,27)-(2,30)
(2,50)-(2,64)
(2,50)-(2,74)
(2,65)-(2,66)
*)
