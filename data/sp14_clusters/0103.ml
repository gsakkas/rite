
let pipe fs = let f a x = a + x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun a  -> x) a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,27)
(fun a -> x) a
AppG [VarG]

(2,30)-(2,31)
fun a -> x
LamG VarG

(2,35)-(2,77)
a
VarG

*)
