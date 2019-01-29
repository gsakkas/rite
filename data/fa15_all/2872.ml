
let pipe fs p =
  let f a x = x (a p) in let base = p in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x p = x (a p) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,21)
fun p -> x (a p)
LamG (AppG (fromList [EmptyG]))

(3,36)-(3,37)
fun x -> x
LamG VarG

(3,41)-(3,65)
x
VarG

*)
