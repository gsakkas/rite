
let sqsum xs =
  let f a x = a + (x * x) in
  let base = 0 "to be implemented" in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(4,13)-(4,34)
(4,15)-(4,34)
*)

(* type error slice
(4,13)-(4,14)
(4,13)-(4,34)
*)

(* all spans
(2,10)-(4,62)
(3,2)-(4,62)
(3,8)-(3,25)
(3,10)-(3,25)
(3,14)-(3,25)
(3,14)-(3,15)
(3,18)-(3,25)
(3,19)-(3,20)
(3,23)-(3,24)
(4,2)-(4,62)
(4,13)-(4,34)
(4,13)-(4,14)
(4,15)-(4,34)
(4,38)-(4,62)
(4,38)-(4,52)
(4,53)-(4,54)
(4,55)-(4,59)
(4,60)-(4,62)
*)
