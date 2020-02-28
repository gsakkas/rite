
let pipe fs = let f a x = a fs in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun n  -> n) a in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,31)
(fun n -> n) a
AppG [VarG]

(2,46)-(2,48)
fun n -> n
LamG VarPatG VarG

*)

(* type error slice
(2,15)-(2,76)
(2,21)-(2,31)
(2,23)-(2,31)
(2,27)-(2,28)
(2,27)-(2,31)
(2,52)-(2,66)
(2,52)-(2,76)
(2,67)-(2,68)
*)
