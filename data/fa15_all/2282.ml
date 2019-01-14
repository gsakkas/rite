
let pipe fs =
  let f a x x' = a x x' in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x' = x (a x') in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,17)-(3,18)
x (a x')
AppG (fromList [AppG (fromList [EmptyG])])

(3,21)-(3,23)
a
VarG

(3,21)-(3,23)
a x'
AppG (fromList [VarG])

*)
