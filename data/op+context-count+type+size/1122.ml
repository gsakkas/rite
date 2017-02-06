
let sqsum xs =
  let f a x x = x * x in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = x * x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,13)-(3,22)
(3,17)-(3,22)
*)

(* type error slice
(2,4)-(3,68)
(2,11)-(3,66)
(3,3)-(3,66)
(3,9)-(3,22)
(3,11)-(3,22)
(3,13)-(3,22)
(3,17)-(3,18)
(3,21)-(3,22)
(3,42)-(3,56)
(3,42)-(3,66)
(3,42)-(3,66)
(3,42)-(3,66)
(3,57)-(3,58)
(3,64)-(3,66)
*)
