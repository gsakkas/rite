
let pipe fs =
  let f a x = match a with | [] -> [] | h::t -> h x in
  let base = 3 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,52)
x
VarG

(4,14)-(4,15)
fun x -> x
LamG VarPatG VarG

*)

(* type error slice
(3,3)-(4,43)
(3,9)-(3,52)
(3,11)-(3,52)
(3,15)-(3,52)
(3,21)-(3,22)
(3,49)-(3,50)
(3,49)-(3,52)
(4,19)-(4,33)
(4,19)-(4,43)
(4,34)-(4,35)
*)
