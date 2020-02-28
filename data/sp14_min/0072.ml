
let pipe fs =
  let f a x c y z = z (a c) in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x c = x c in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,28)
x c
AppG [VarG]

*)

(* type error slice
(3,3)-(3,74)
(3,9)-(3,28)
(3,11)-(3,28)
(3,13)-(3,28)
(3,15)-(3,28)
(3,17)-(3,28)
(3,21)-(3,22)
(3,21)-(3,28)
(3,23)-(3,28)
(3,24)-(3,25)
(3,50)-(3,64)
(3,50)-(3,74)
(3,65)-(3,66)
*)
