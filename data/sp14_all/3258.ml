
let pipe fs =
  let f a x = let existing = a in let next = x in existing next in
  let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,34)-(3,63)
fun a -> fun x -> x
LamG (LamG EmptyG)

(3,45)-(3,46)
fun x -> x
LamG VarG

*)
