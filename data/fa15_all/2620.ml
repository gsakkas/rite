
let pipe fs =
  let f a x a x = x a in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun x  -> x) a in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,18)-(3,19)
fun x -> x
LamG VarG

*)
