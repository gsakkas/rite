
let sqsum xs =
  let f a x a x = a + (x * x) in let base = xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x a x = a + x in
  let base = 0 in List.fold_left (fun a  -> fun x  -> a + (x * x)) 0 xs;;

*)

(* changed spans
(3,24)-(3,29)
(3,28)-(3,29)
(3,34)-(3,75)
(3,45)-(3,47)
(3,51)-(3,75)
(3,66)-(3,67)
(3,68)-(3,72)
(3,73)-(3,75)
*)

(* type error slice
(3,3)-(3,75)
(3,9)-(3,29)
(3,11)-(3,29)
(3,13)-(3,29)
(3,34)-(3,75)
(3,45)-(3,47)
(3,51)-(3,65)
(3,51)-(3,75)
(3,66)-(3,67)
(3,68)-(3,72)
(3,73)-(3,75)
*)
