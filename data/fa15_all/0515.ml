
let pipe fs =
  let f a x n = n a (a x) in let base f = f in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x n = x (a n) in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(3,17)-(3,26)
x (a n)
AppG (fromList [AppG (fromList [EmptyG])])

(3,43)-(3,44)
0
LitG

*)

(* type error slice
(3,3)-(3,72)
(3,9)-(3,26)
(3,11)-(3,26)
(3,13)-(3,26)
(3,17)-(3,18)
(3,17)-(3,26)
(3,19)-(3,20)
(3,48)-(3,62)
(3,48)-(3,72)
(3,63)-(3,64)
*)
