
let pipe fs =
  match fs with
  | [] -> 0
  | f::fs' -> let f a x = x a in let base = f in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x p = x (a p) in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,3)-(5,74)
(3,9)-(3,11)
(4,11)-(4,12)
(5,27)-(5,30)
(5,29)-(5,30)
(5,34)-(5,74)
(5,45)-(5,46)
(5,50)-(5,74)
*)

(* type error slice
(5,15)-(5,74)
(5,21)-(5,30)
(5,23)-(5,30)
(5,27)-(5,28)
(5,27)-(5,30)
(5,29)-(5,30)
(5,34)-(5,74)
(5,45)-(5,46)
(5,50)-(5,64)
(5,50)-(5,74)
(5,65)-(5,66)
(5,67)-(5,71)
(5,72)-(5,74)
*)
