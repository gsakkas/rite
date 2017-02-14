
let f a x = let (r,s) = x in r + s;;

let pipe fs =
  let f a x a x = f x f a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x a x = a x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,6)-(2,34)
(2,8)-(2,34)
(2,12)-(2,34)
(2,24)-(2,25)
(2,29)-(2,30)
(2,29)-(2,34)
(2,33)-(2,34)
(5,2)-(5,71)
(5,18)-(5,19)
(5,18)-(5,25)
(5,20)-(5,21)
(5,22)-(5,23)
(5,24)-(5,25)
(5,29)-(5,71)
*)

(* type error slice
(5,18)-(5,19)
(5,18)-(5,25)
(5,22)-(5,23)
*)
