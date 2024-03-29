
let pipe fs =
  let f a x = let h::t = fs in h a x in
  let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = x (a g) in let base k = k in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,37)
fun g -> x (a g)
LamG VarPatG (AppG [EmptyG])

(4,14)-(4,16)
fun k -> k
LamG VarPatG VarG

*)

(* type error slice
(3,3)-(4,44)
(3,9)-(3,37)
(3,11)-(3,37)
(3,15)-(3,37)
(3,26)-(3,28)
(3,32)-(3,33)
(3,32)-(3,37)
(3,36)-(3,37)
(4,20)-(4,34)
(4,20)-(4,44)
(4,35)-(4,36)
(4,42)-(4,44)
*)
