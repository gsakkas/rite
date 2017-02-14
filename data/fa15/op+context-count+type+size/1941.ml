
let sqsum xs =
  let f a x = a + (x * x) in let base x = x in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,39)-(3,44)
(3,43)-(3,44)
*)

(* type error slice
(3,3)-(3,72)
(3,9)-(3,25)
(3,15)-(3,16)
(3,15)-(3,25)
(3,30)-(3,72)
(3,39)-(3,44)
(3,48)-(3,62)
(3,48)-(3,72)
(3,63)-(3,64)
(3,65)-(3,69)
*)
