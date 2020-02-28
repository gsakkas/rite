
let pipe fs =
  let f a x x' = x' a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x' = a x' in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,18)-(3,22)
a x'
AppG [VarG]

*)

(* type error slice
(3,3)-(3,68)
(3,9)-(3,22)
(3,11)-(3,22)
(3,13)-(3,22)
(3,18)-(3,20)
(3,18)-(3,22)
(3,21)-(3,22)
(3,44)-(3,58)
(3,44)-(3,68)
(3,59)-(3,60)
*)
