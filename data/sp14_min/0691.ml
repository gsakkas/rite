
let pipe fs =
  let f a x (x,a) = x a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,24)
x
VarG

*)

(* type error slice
(3,3)-(3,70)
(3,9)-(3,24)
(3,11)-(3,24)
(3,14)-(3,24)
(3,21)-(3,22)
(3,21)-(3,24)
(3,28)-(3,70)
(3,37)-(3,42)
(3,41)-(3,42)
(3,46)-(3,60)
(3,46)-(3,70)
(3,61)-(3,62)
(3,63)-(3,67)
*)
