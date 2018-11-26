
let pipe fs =
  let f a x x' = x' (x a) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x' = x (a x') in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,23)-(3,24)
a x'
AppG (fromList [VarG])

(3,29)-(3,71)
x'
VarG

*)
