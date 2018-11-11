
let pipe fs =
  let f a x x = x a in let base x1 = x1 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x a = x a in let base x1 = x1 in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,19)
fun a -> x a
LamG (AppG [EmptyG])

*)
