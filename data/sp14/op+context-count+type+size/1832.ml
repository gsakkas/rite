
let pipe fs =
  match fs with
  | [] -> 0
  | f::fs' -> let f a x = x a in let base = f in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x p = x (a p) in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(5,73)
(3,8)-(3,10)
(4,10)-(4,11)
(5,14)-(5,73)
(5,26)-(5,29)
(5,28)-(5,29)
(5,33)-(5,73)
(5,44)-(5,45)
(5,49)-(5,73)
*)

(* type error slice
(5,33)-(5,73)
(5,44)-(5,45)
(5,49)-(5,63)
(5,49)-(5,73)
(5,64)-(5,65)
(5,66)-(5,70)
*)
