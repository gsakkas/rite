
let pipe fs =
  let f a x c x = a x in let base g x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base g x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,13)-(3,22)
a
VarG

*)

(* type error slice
(3,3)-(3,70)
(3,9)-(3,22)
(3,11)-(3,22)
(3,13)-(3,22)
(3,15)-(3,22)
(3,19)-(3,20)
(3,19)-(3,22)
(3,46)-(3,60)
(3,46)-(3,70)
(3,61)-(3,62)
*)
