
let sqsum xs = let f a x = a ** x in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(2,16)-(2,78)
(2,28)-(2,29)
(2,28)-(2,34)
(2,30)-(2,32)
(2,33)-(2,34)
(2,38)-(2,78)
(2,49)-(2,50)
*)

(* type error slice
(2,16)-(2,78)
(2,22)-(2,34)
(2,28)-(2,29)
(2,28)-(2,34)
(2,30)-(2,32)
(2,38)-(2,78)
(2,49)-(2,50)
(2,54)-(2,68)
(2,54)-(2,78)
(2,69)-(2,70)
(2,71)-(2,75)
*)
