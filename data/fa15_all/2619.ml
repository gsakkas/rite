
let pipe fs = let f a x x = x a in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun x  -> x) a in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,28)-(2,29)
fun x -> x
LamG VarG

*)
