
let pipe fs =
  let f a x f x f a = f a x in let base y z = z in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x z = x (a z) in let base z = z in List.fold_left f base fs;;

*)

(* changed spans
(3,24)-(3,25)
fun z -> x (a z)
LamG (AppG (fromList [EmptyG]))

(3,26)-(3,27)
x (a z)
AppG (fromList [AppG (fromList [EmptyG])])

(3,31)-(3,75)
a
VarG

(3,31)-(3,75)
z
VarG

(3,31)-(3,75)
a z
AppG (fromList [VarG])

*)
