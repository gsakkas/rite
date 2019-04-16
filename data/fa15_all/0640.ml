
let pipe fs =
  let f a x = let h::t = x in h a t in
  let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = x (a g) in let base k = k in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,36)
fun g -> x (a g)
LamG VarPatG (AppG (fromList [EmptyG]))

(4,14)-(4,16)
fun k -> k
LamG VarPatG VarG

*)

(* type error slice
(3,15)-(3,36)
(3,31)-(3,32)
(3,31)-(3,36)
(3,35)-(3,36)
*)
