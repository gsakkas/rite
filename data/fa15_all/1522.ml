
let pipe fs =
  let f a x k = a x k in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x k = x (a k) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,17)
x (a k)
AppG (fromList [AppG (fromList [EmptyG])])

(3,20)-(3,21)
a
VarG

(3,20)-(3,21)
a k
AppG (fromList [VarG])

*)
