
let pipe fs =
  let f a x y c = a in let base g x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base g x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,13)-(3,20)
a
VarG

*)

(* type error slice
(3,3)-(3,68)
(3,9)-(3,20)
(3,11)-(3,20)
(3,13)-(3,20)
(3,15)-(3,20)
(3,19)-(3,20)
(3,44)-(3,58)
(3,44)-(3,68)
(3,59)-(3,60)
*)
