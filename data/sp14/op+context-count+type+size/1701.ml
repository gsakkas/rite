
let sqsum xs =
  let f a x a x = x *. x in let base = 0.0 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = x * x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,2)-(3,70)
(3,8)-(3,24)
(3,10)-(3,24)
(3,18)-(3,24)
(3,28)-(3,70)
(3,39)-(3,42)
(3,46)-(3,70)
*)

(* type error slice
(3,2)-(3,70)
(3,8)-(3,24)
(3,10)-(3,24)
(3,12)-(3,24)
(3,28)-(3,70)
(3,39)-(3,42)
(3,46)-(3,60)
(3,46)-(3,70)
(3,61)-(3,62)
(3,63)-(3,67)
*)
