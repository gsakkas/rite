
let f a x = a * a;;

let sqsum xs =
  let f a x = (a * a) + (f List.hd xs x) in
  let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(2,6)-(2,17)
(2,8)-(2,17)
(2,12)-(2,13)
(2,12)-(2,17)
(2,16)-(2,17)
(5,2)-(6,42)
(5,24)-(5,40)
(5,25)-(5,26)
(5,27)-(5,34)
(5,38)-(5,39)
(6,2)-(6,42)
*)

(* type error slice
(2,3)-(2,19)
(2,6)-(2,17)
(2,12)-(2,13)
(2,12)-(2,17)
(5,24)-(5,40)
(5,25)-(5,26)
(5,27)-(5,34)
*)
