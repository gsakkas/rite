
let sqsum xs =
  let f a x a x = x *. x in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = x * x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,13)-(3,25)
(3,15)-(3,25)
(3,19)-(3,25)
*)

(* type error slice
(2,4)-(3,71)
(2,11)-(3,69)
(3,3)-(3,69)
(3,9)-(3,25)
(3,11)-(3,25)
(3,13)-(3,25)
(3,15)-(3,25)
(3,19)-(3,20)
(3,24)-(3,25)
(3,45)-(3,59)
(3,45)-(3,69)
(3,45)-(3,69)
(3,45)-(3,69)
(3,60)-(3,61)
(3,67)-(3,69)
*)
