
let sqsum xs =
  let f a x = (a ** 2.) + x in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,16)-(3,23)
(3,18)-(3,20)
(3,21)-(3,23)
(3,32)-(3,72)
*)

(* type error slice
(3,16)-(3,23)
(3,16)-(3,28)
(3,18)-(3,20)
*)
