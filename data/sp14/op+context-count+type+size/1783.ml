
let sqsum xs =
  let f a x = (a * a) + x in let base = [] in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,40)-(3,42)
*)

(* type error slice
(3,2)-(3,70)
(3,8)-(3,25)
(3,14)-(3,21)
(3,15)-(3,16)
(3,29)-(3,70)
(3,40)-(3,42)
(3,46)-(3,60)
(3,46)-(3,70)
(3,61)-(3,62)
(3,63)-(3,67)
*)
