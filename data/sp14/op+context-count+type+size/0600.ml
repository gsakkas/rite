
let sqsum xs =
  let f a x = x ** 2.0 in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = x * x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,2)-(3,66)
(3,14)-(3,22)
(3,16)-(3,18)
(3,19)-(3,22)
(3,26)-(3,66)
(3,37)-(3,38)
*)

(* type error slice
(3,2)-(3,66)
(3,8)-(3,22)
(3,10)-(3,22)
(3,14)-(3,22)
(3,16)-(3,18)
(3,26)-(3,66)
(3,37)-(3,38)
(3,42)-(3,56)
(3,42)-(3,66)
(3,57)-(3,58)
(3,59)-(3,63)
*)
