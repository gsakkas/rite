
let pipe fs =
  let f a x y z = z y in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x fn = x (fun a  -> a) in
  let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,21)
fun fn -> x (fun a -> a)
LamG (AppG (fromList [EmptyG]))

(3,43)-(3,67)
a
VarG

(3,43)-(3,67)
b
VarG

(3,43)-(3,67)
fun a -> a
LamG VarG

(3,43)-(3,67)
fun b -> b
LamG VarG

(3,43)-(3,67)
let base = fun b -> b in
List.fold_left f base fs
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)
