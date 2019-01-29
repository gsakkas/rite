
let pipe fs =
  let f a x g = (g a) x in let base g = g in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = x (a g) in let base g = g in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,21)
x
VarG

(3,22)-(3,23)
g
VarG

*)
