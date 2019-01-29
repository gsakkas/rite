
let pipe fs =
  let f a x y = y (a y) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,17)
x
VarG

*)
