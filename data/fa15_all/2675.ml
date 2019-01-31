
let pipe fs =
  let f a x y c = x (a c) in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,23)-(3,24)
y
VarG

*)
