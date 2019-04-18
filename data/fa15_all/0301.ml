
let pipe fs = let f a x = fs x in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun n  -> n) a in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,31)
(fun n -> n) a
AppG (fromList [VarG])

(2,46)-(2,47)
fun n -> n
LamG VarPatG VarG

*)

(* type error slice
(2,27)-(2,29)
(2,27)-(2,31)
(2,51)-(2,65)
(2,51)-(2,75)
(2,73)-(2,75)
*)
