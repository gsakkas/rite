
let pipe fs =
  let f a x y = a (y x) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x x = a x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,23)
fun x -> a x
LamG (AppG (fromList [EmptyG]))

(3,40)-(3,41)
fun y -> y
LamG VarG

(3,45)-(3,69)
y
VarG

*)
