
let pipe fs =
  let f a x x' y = (x a) + a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = x a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(3,74)
(3,12)-(3,28)
(3,15)-(3,28)
(3,19)-(3,28)
(3,27)-(3,28)
(3,32)-(3,74)
*)

(* type error slice
(3,2)-(3,74)
(3,8)-(3,28)
(3,10)-(3,28)
(3,12)-(3,28)
(3,19)-(3,28)
(3,27)-(3,28)
(3,50)-(3,64)
(3,50)-(3,74)
(3,65)-(3,66)
*)
