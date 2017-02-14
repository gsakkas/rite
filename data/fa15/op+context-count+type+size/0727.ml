
let f a x = a * a;;

let sqsum xs =
  let f a x = let aa = a * a in aa + f in
  let base = List.hd xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + (x * x) in
  let base = List.hd xs in List.fold_left f base xs;;

*)

(* changed spans
(2,7)-(2,18)
(2,9)-(2,18)
(2,13)-(2,14)
(2,13)-(2,18)
(2,17)-(2,18)
(5,3)-(6,52)
(5,15)-(5,39)
(5,33)-(5,35)
(5,33)-(5,39)
(5,38)-(5,39)
(6,3)-(6,52)
(6,14)-(6,24)
*)

(* type error slice
(2,4)-(2,20)
(2,7)-(2,18)
(5,33)-(5,39)
(5,38)-(5,39)
*)
