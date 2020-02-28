
let x l = List.map string_of_int;;

let pipe fs = let f a x = a x in let base = x in List.fold_left f base fs;;


(* fix

let x l = List.map string_of_int;;

let pipe fs = let f a x = a in let base = x in List.fold_left f base fs;;

*)

(* changed spans
(4,27)-(4,30)
a
VarG

*)

(* type error slice
(4,15)-(4,74)
(4,21)-(4,30)
(4,23)-(4,30)
(4,27)-(4,28)
(4,27)-(4,30)
(4,50)-(4,64)
(4,50)-(4,74)
(4,65)-(4,66)
*)
