
let pipe fs =
  let f a x b x a = x a b in let base i = i in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x b = x (a b) in let base i = i in List.fold_left f base fs;;

*)

(* changed spans
(3,20)-(3,25)
x (a b)
AppG (fromList [AppG (fromList [EmptyG])])

(3,22)-(3,23)
a b
AppG (fromList [VarG])

*)
