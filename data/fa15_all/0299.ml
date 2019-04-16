
let pipe fs =
  let f a x = (x + x) + a in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun n  -> n) a in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,26)
(fun n -> n) a
AppG (fromList [VarG])

(3,41)-(3,43)
fun n -> n
LamG VarPatG VarG

*)

(* type error slice
(3,3)-(3,71)
(3,9)-(3,26)
(3,15)-(3,26)
(3,25)-(3,26)
(3,30)-(3,71)
(3,41)-(3,43)
(3,47)-(3,61)
(3,47)-(3,71)
(3,62)-(3,63)
(3,64)-(3,68)
*)
