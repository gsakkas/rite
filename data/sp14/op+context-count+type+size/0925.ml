
let sqsum xs =
  let f a x = (a * a) + xs in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,24)-(3,26)
(3,30)-(3,70)
(3,41)-(3,42)
*)

(* type error slice
(3,14)-(3,26)
(3,24)-(3,26)
(3,46)-(3,60)
(3,46)-(3,70)
(3,68)-(3,70)
*)
