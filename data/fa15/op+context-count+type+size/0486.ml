
let pipe fs =
  let f a x combine x = x a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x c = x (a c) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,13)-(3,28)
(3,21)-(3,28)
(3,27)-(3,28)
(3,32)-(3,74)
(3,41)-(3,46)
*)

(* type error slice
(3,3)-(3,74)
(3,9)-(3,28)
(3,11)-(3,28)
(3,13)-(3,28)
(3,21)-(3,28)
(3,25)-(3,26)
(3,25)-(3,28)
(3,27)-(3,28)
(3,50)-(3,64)
(3,50)-(3,74)
(3,65)-(3,66)
*)
