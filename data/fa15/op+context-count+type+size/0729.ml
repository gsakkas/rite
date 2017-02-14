
let f a x = a * a;;

let sqsum xs =
  let f a x = (a * a) + (f List.hd xs x) in
  let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(2,7)-(2,18)
(2,9)-(2,18)
(2,13)-(2,14)
(2,13)-(2,18)
(2,17)-(2,18)
(5,3)-(6,43)
(5,26)-(5,27)
(5,26)-(5,40)
(5,28)-(5,35)
(5,39)-(5,40)
(6,3)-(6,43)
*)

(* type error slice
(2,4)-(2,20)
(2,7)-(2,18)
(2,13)-(2,14)
(2,13)-(2,18)
(5,26)-(5,27)
(5,26)-(5,40)
(5,28)-(5,35)
*)
