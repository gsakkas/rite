
let pipe fs =
  let f a x x' = x' a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x' = x x' in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,17)-(3,19)
x
VarG

*)
