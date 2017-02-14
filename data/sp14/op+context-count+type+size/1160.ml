
let sqsum xs =
  let f a x = (a ** 2.) +. x in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,23)
(3,14)-(3,28)
(3,15)-(3,16)
(3,17)-(3,19)
(3,20)-(3,22)
(3,32)-(3,72)
*)

(* type error slice
(3,2)-(3,72)
(3,8)-(3,28)
(3,14)-(3,23)
(3,15)-(3,16)
(3,17)-(3,19)
(3,32)-(3,72)
(3,43)-(3,44)
(3,48)-(3,62)
(3,48)-(3,72)
(3,63)-(3,64)
(3,65)-(3,69)
*)
