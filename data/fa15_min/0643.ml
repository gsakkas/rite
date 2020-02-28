
let pipe fs =
  let f a x = match a with | [] -> 0 | h::t -> h x in
  let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = x (a g) in let base k = k in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,51)
fun g -> x (a g)
LamG VarPatG (AppG [EmptyG])

(4,14)-(4,15)
fun k -> k
LamG VarPatG VarG

*)

(* type error slice
(3,3)-(4,43)
(3,9)-(3,51)
(3,11)-(3,51)
(3,15)-(3,51)
(3,21)-(3,22)
(3,48)-(3,49)
(3,48)-(3,51)
(4,19)-(4,33)
(4,19)-(4,43)
(4,34)-(4,35)
*)
