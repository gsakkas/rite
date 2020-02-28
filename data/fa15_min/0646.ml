
let pipe fs =
  let f a x = List.fold_right a [] x in
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
(3,15)-(3,30)
(3,15)-(3,37)
(3,31)-(3,32)
(4,20)-(4,34)
(4,20)-(4,44)
(4,35)-(4,36)
*)
