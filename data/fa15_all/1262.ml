
let pipe fs =
  let f a x b x a = x a b in let base i = i in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x b = x (a b) in let base i = i in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,26)
x (a b)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(3,3)-(3,72)
(3,9)-(3,26)
(3,11)-(3,26)
(3,13)-(3,26)
(3,15)-(3,26)
(3,21)-(3,22)
(3,21)-(3,26)
(3,25)-(3,26)
(3,30)-(3,72)
(3,39)-(3,44)
(3,43)-(3,44)
(3,48)-(3,62)
(3,48)-(3,72)
(3,63)-(3,64)
(3,65)-(3,69)
*)
