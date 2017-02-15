
let sqsum xs =
  let f a x = (a ^ 2) :: x in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,21)
(3,14)-(3,26)
(3,15)-(3,16)
(3,17)-(3,18)
(3,19)-(3,20)
(3,30)-(3,70)
*)

(* type error slice
(3,2)-(3,70)
(3,8)-(3,26)
(3,10)-(3,26)
(3,14)-(3,21)
(3,14)-(3,26)
(3,15)-(3,16)
(3,17)-(3,18)
(3,19)-(3,20)
(3,46)-(3,60)
(3,46)-(3,70)
(3,61)-(3,62)
*)
