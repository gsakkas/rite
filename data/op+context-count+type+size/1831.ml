
let pipe fs =
  match fs with
  | [] -> 0
  | f::fs' -> let f a x = x a in let base = fs' in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x p = x (a p) in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,3)-(5,76)
(3,9)-(3,11)
(4,11)-(4,12)
(5,15)-(5,76)
(5,27)-(5,30)
(5,29)-(5,30)
(5,34)-(5,76)
(5,45)-(5,48)
(5,52)-(5,76)
*)

(* type error slice
(3,3)-(5,76)
(3,3)-(5,76)
(3,9)-(3,11)
(5,15)-(5,76)
(5,21)-(5,30)
(5,23)-(5,30)
(5,27)-(5,28)
(5,27)-(5,30)
(5,34)-(5,76)
(5,45)-(5,48)
(5,52)-(5,66)
(5,52)-(5,76)
(5,67)-(5,68)
(5,69)-(5,73)
(5,74)-(5,76)
*)
