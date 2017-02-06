
let sqsum xs =
  let f a x sum x = sum + (x * x) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,13)-(3,33)
(3,17)-(3,33)
(3,21)-(3,24)
(3,28)-(3,29)
(3,28)-(3,33)
*)

(* type error slice
(2,4)-(3,80)
(2,11)-(3,78)
(3,3)-(3,78)
(3,9)-(3,33)
(3,11)-(3,33)
(3,13)-(3,33)
(3,17)-(3,33)
(3,21)-(3,24)
(3,28)-(3,29)
(3,32)-(3,33)
(3,54)-(3,68)
(3,54)-(3,78)
(3,54)-(3,78)
(3,54)-(3,78)
(3,69)-(3,70)
(3,76)-(3,78)
*)
