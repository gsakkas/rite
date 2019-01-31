
let pipe fs =
  let f a x y z = z y in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,18)-(3,19)
x
VarG

(3,20)-(3,21)
a
VarG

(3,20)-(3,21)
a y
AppG (fromList [VarG])

*)
