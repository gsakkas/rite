
let pipe fs =
  let f a x l x = x a in let base p = p in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x l = x (a l) in let base p = p in List.fold_left f base fs;;

*)

(* changed spans
(3,20)-(3,21)
a l
AppG [VarG]

(3,25)-(3,67)
l
VarG

*)
