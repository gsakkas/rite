
let pipe fs =
  let f a x a = x x a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x a = x (x a) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,21)
x (x a)
AppG (fromList [AppG (fromList [EmptyG])])

(3,18)-(3,19)
x a
AppG (fromList [VarG])

*)
