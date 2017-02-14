
let pipe fs =
  match fs with
  | [] -> 0
  | f::fs' -> let f a x = x a in let base = fs' in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x p = x (a p) in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(5,75)
(3,8)-(3,10)
(4,10)-(4,11)
(5,14)-(5,75)
(5,26)-(5,29)
(5,28)-(5,29)
(5,33)-(5,75)
(5,44)-(5,47)
(5,51)-(5,75)
*)

(* type error slice
(3,2)-(5,75)
(3,2)-(5,75)
(3,8)-(3,10)
(5,14)-(5,75)
(5,20)-(5,29)
(5,22)-(5,29)
(5,26)-(5,27)
(5,26)-(5,29)
(5,33)-(5,75)
(5,44)-(5,47)
(5,51)-(5,65)
(5,51)-(5,75)
(5,66)-(5,67)
(5,68)-(5,72)
(5,73)-(5,75)
*)
