
let sqsum xs =
  let f a x = (a ** 2.) + x in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,23)
(3,17)-(3,19)
(3,20)-(3,22)
(3,31)-(3,71)
*)

(* type error slice
(3,14)-(3,23)
(3,14)-(3,27)
(3,17)-(3,19)
*)
