
let sqsum xs =
  let f a x = a ^ (2 + x) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,15)-(3,16)
(3,15)-(3,25)
(3,17)-(3,18)
(3,20)-(3,21)
(3,24)-(3,25)
*)

(* type error slice
(3,3)-(3,70)
(3,9)-(3,25)
(3,15)-(3,16)
(3,15)-(3,25)
(3,17)-(3,18)
(3,20)-(3,25)
(3,30)-(3,70)
(3,41)-(3,42)
(3,46)-(3,60)
(3,46)-(3,70)
(3,61)-(3,62)
(3,63)-(3,67)
*)
