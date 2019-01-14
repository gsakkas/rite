
let pipe fs =
  let f a x x a = a x in let base n = n in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(3,25)-(3,67)
a
VarG

*)
