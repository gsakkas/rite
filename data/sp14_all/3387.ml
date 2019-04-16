
let pipe fs =
  let f a x = match a with | [] -> x | h::t -> h x in
  let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,51)
x
VarG

(4,14)-(4,15)
fun x -> x
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
