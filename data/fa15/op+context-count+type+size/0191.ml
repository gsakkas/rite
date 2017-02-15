
let sqsum xs =
  let f a x = a + (x ** 2) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,18)-(3,26)
(3,21)-(3,23)
(3,24)-(3,25)
(3,30)-(3,70)
(3,41)-(3,42)
*)

(* type error slice
(3,18)-(3,26)
(3,21)-(3,23)
(3,24)-(3,25)
*)
