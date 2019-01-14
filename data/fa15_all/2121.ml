
let pipe fs =
  let f a x y = a x y in let base x' = x' in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x' = x' in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,17)
x (a y)
AppG (fromList [AppG (fromList [EmptyG])])

(3,20)-(3,21)
a
VarG

(3,20)-(3,21)
a y
AppG (fromList [VarG])

*)
