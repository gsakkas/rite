
let sqsum xs =
  let f a x mb x = (x * x) + a in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (x * x) + a in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,12)-(3,30)
(3,15)-(3,30)
(3,34)-(3,74)
*)

(* type error slice
(3,2)-(3,74)
(3,8)-(3,30)
(3,10)-(3,30)
(3,12)-(3,30)
(3,19)-(3,30)
(3,29)-(3,30)
(3,50)-(3,64)
(3,50)-(3,74)
(3,65)-(3,66)
*)
