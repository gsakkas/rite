
let pipe fs =
  let f a x x' a = x (a x') in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x' = x (a x') in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,28)
x (a x')
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(3,3)-(3,74)
(3,9)-(3,28)
(3,11)-(3,28)
(3,13)-(3,28)
(3,16)-(3,28)
(3,22)-(3,28)
(3,23)-(3,24)
(3,25)-(3,27)
(3,32)-(3,74)
(3,41)-(3,46)
(3,45)-(3,46)
(3,50)-(3,64)
(3,50)-(3,74)
(3,65)-(3,66)
(3,67)-(3,71)
*)
