
let pipe fs =
  let f a x = match fs with | x::y -> x in
  let base = f in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(4,13)-(4,14)
fun y -> y
LamG VarG

(4,18)-(4,42)
y
VarG

*)
