
let sqsum xs =
  let f a x f _ = a * a in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = a * x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,2)-(3,67)
(3,12)-(3,23)
(3,14)-(3,23)
(3,22)-(3,23)
(3,27)-(3,67)
(3,38)-(3,39)
*)

(* type error slice
(3,2)-(3,67)
(3,8)-(3,23)
(3,10)-(3,23)
(3,12)-(3,23)
(3,18)-(3,19)
(3,18)-(3,23)
(3,43)-(3,57)
(3,43)-(3,67)
(3,58)-(3,59)
*)
