
let pipe fs =
  let f a x = function | [] -> x | h::fs' -> h x in
  let base = function | [] -> fs in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,49)
a
VarG

(4,14)-(4,33)
fun fs -> fs
LamG VarPatG VarG

*)

(* type error slice
(3,3)-(4,61)
(3,9)-(3,49)
(3,11)-(3,49)
(3,15)-(3,49)
(3,32)-(3,33)
(4,3)-(4,61)
(4,14)-(4,33)
(4,31)-(4,33)
(4,37)-(4,51)
(4,37)-(4,61)
(4,52)-(4,53)
(4,54)-(4,58)
(4,59)-(4,61)
*)
