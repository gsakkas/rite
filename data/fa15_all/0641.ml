
let pipe fs =
  let f a x = let h::t = fs in a = (h x) in
  let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = x (a g) in let base k = k in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,41)
fun g -> x (a g)
LamG VarPatG (AppG [EmptyG])

(4,14)-(4,15)
fun k -> k
LamG VarPatG VarG

*)

(* type error slice
(3,3)-(4,43)
(3,9)-(3,41)
(3,11)-(3,41)
(3,15)-(3,41)
(3,32)-(3,41)
(4,3)-(4,43)
(4,14)-(4,15)
(4,19)-(4,33)
(4,19)-(4,43)
(4,34)-(4,35)
(4,36)-(4,40)
*)
