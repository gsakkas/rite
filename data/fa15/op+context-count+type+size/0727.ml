
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
(2,6)-(2,17)
(2,8)-(2,17)
(2,12)-(2,13)
(2,12)-(2,17)
(2,16)-(2,17)
(5,2)-(6,51)
(5,14)-(5,38)
(5,32)-(5,34)
(5,32)-(5,38)
(5,37)-(5,38)
(6,2)-(6,51)
(6,13)-(6,23)
*)

(* type error slice
(2,3)-(2,19)
(2,6)-(2,17)
(5,32)-(5,38)
(5,37)-(5,38)
*)
