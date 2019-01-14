
let f a x = let (r,s) = x in r + s;;

let pipe fs =
  let f a x a x = f x f a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x a x = a x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(5,22)-(5,23)
a x
AppG (fromList [VarG])

(5,29)-(5,71)
x
VarG

*)
