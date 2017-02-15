
let sqsum xs =
  let f a x = a + (x ** 2.) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,18)-(3,27)
(3,21)-(3,23)
(3,24)-(3,26)
(3,31)-(3,71)
(3,42)-(3,43)
*)

(* type error slice
(3,14)-(3,27)
(3,18)-(3,27)
(3,21)-(3,23)
*)
