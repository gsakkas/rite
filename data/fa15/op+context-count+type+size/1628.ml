
let sqsum xs =
  let f a x = a + (x ** 2.) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,20)-(3,27)
(3,22)-(3,24)
(3,25)-(3,27)
(3,32)-(3,72)
(3,43)-(3,44)
*)

(* type error slice
(3,15)-(3,27)
(3,20)-(3,27)
(3,22)-(3,24)
*)
