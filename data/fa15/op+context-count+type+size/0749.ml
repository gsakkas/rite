
let f a x = let (r,s) = x in r + s;;

let pipe fs =
  let f a x a x = f x f a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x a x = a x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,7)-(2,35)
(2,9)-(2,35)
(2,13)-(2,35)
(2,25)-(2,26)
(2,30)-(2,31)
(2,30)-(2,35)
(2,34)-(2,35)
(5,3)-(5,72)
(5,19)-(5,20)
(5,19)-(5,26)
(5,21)-(5,22)
(5,23)-(5,24)
(5,25)-(5,26)
(5,30)-(5,72)
*)

(* type error slice
(5,19)-(5,20)
(5,19)-(5,26)
(5,23)-(5,24)
*)
