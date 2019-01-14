
let pipe fs =
  let f a x = function | [] -> x | h::fs' -> h x in
  let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(3,47)-(3,48)
a
VarG

(4,13)-(4,15)
fun fs -> fs
LamG VarG

(4,19)-(4,43)
fs
VarG

*)
