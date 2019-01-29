
let pipe fs =
  let f a x g = g (x a) in let base g = g in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = x (a g) in let base g = g in List.fold_left f base fs;;

*)

(* changed spans
(3,21)-(3,22)
a g
AppG (fromList [VarG])

(3,27)-(3,69)
g
VarG

*)
