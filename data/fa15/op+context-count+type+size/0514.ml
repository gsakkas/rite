
let sqsum xs =
  let f a x x = (x * x) + a in let base = [] in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (x * x) + a in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,13)-(3,28)
(3,32)-(3,73)
(3,43)-(3,45)
(3,49)-(3,73)
*)

(* type error slice
(3,3)-(3,73)
(3,9)-(3,28)
(3,11)-(3,28)
(3,13)-(3,28)
(3,18)-(3,28)
(3,27)-(3,28)
(3,49)-(3,63)
(3,49)-(3,73)
(3,64)-(3,65)
*)
