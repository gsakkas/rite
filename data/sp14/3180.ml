
let pipe fs =
  let f a x f = a (f x) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,13)-(3,24)
x
VarG

*)

(* type error slice
(3,3)-(3,70)
(3,9)-(3,24)
(3,11)-(3,24)
(3,13)-(3,24)
(3,17)-(3,18)
(3,17)-(3,24)
(3,19)-(3,24)
(3,20)-(3,21)
(3,46)-(3,60)
(3,46)-(3,70)
(3,61)-(3,62)
*)
