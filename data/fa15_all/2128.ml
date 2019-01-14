
let pipe fs =
  let f a x = x a in let base = List.hd fs in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,40)-(3,42)
fun x -> x
LamG VarG

(3,46)-(3,70)
x
VarG

*)
