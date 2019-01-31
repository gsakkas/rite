
let pipe fs =
  let f a x = (x + x) + a in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun n  -> n) a in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(3,19)-(3,20)
(fun n -> n) a
AppG (fromList [VarG])

(3,24)-(3,25)
n
VarG

(3,24)-(3,25)
fun n -> n
LamG VarG

(3,40)-(3,42)
fun n -> n
LamG VarG

(3,46)-(3,70)
n
VarG

*)
