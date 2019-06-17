
let pipe fs =
  let f a x = (fun result  -> fun x  -> a + x) 0 in
  let base = 1 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x n = x (a n) in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,49)
fun n -> x (a n)
LamG VarPatG (AppG [EmptyG])

(4,14)-(4,15)
fun f -> 0
LamG VarPatG LitG

*)

(* type error slice
(3,3)-(4,43)
(3,9)-(3,49)
(3,11)-(3,49)
(3,15)-(3,47)
(3,15)-(3,49)
(3,31)-(3,46)
(3,41)-(3,42)
(3,41)-(3,46)
(4,19)-(4,33)
(4,19)-(4,43)
(4,34)-(4,35)
*)
