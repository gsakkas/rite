
let sqsum xs =
  let f a x = a * a in let base = f xs xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in let base = f 8 xs in List.fold_left f base xs;;

*)

(* changed spans
(3,36)-(3,38)
*)

(* type error slice
(3,2)-(3,69)
(3,8)-(3,19)
(3,14)-(3,15)
(3,14)-(3,19)
(3,34)-(3,35)
(3,34)-(3,41)
(3,36)-(3,38)
(3,45)-(3,59)
(3,45)-(3,69)
(3,67)-(3,69)
*)

(* all spans
(2,10)-(3,69)
(3,2)-(3,69)
(3,8)-(3,19)
(3,10)-(3,19)
(3,14)-(3,19)
(3,14)-(3,15)
(3,18)-(3,19)
(3,23)-(3,69)
(3,34)-(3,41)
(3,34)-(3,35)
(3,36)-(3,38)
(3,39)-(3,41)
(3,45)-(3,69)
(3,45)-(3,59)
(3,60)-(3,61)
(3,62)-(3,66)
(3,67)-(3,69)
*)