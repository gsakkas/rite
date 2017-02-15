
let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_right f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,45)-(3,60)
*)

(* type error slice
(3,29)-(3,70)
(3,40)-(3,41)
(3,45)-(3,60)
(3,45)-(3,70)
(3,63)-(3,67)
*)
