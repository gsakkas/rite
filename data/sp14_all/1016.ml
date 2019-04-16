
let pipe fs =
  let f a x = List.rev x in let base p = p in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base p = p in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,25)
x
VarG

*)

(* type error slice
(3,3)-(3,71)
(3,9)-(3,25)
(3,11)-(3,25)
(3,15)-(3,23)
(3,15)-(3,25)
(3,29)-(3,71)
(3,38)-(3,43)
(3,47)-(3,61)
(3,47)-(3,71)
(3,62)-(3,63)
(3,64)-(3,68)
*)
