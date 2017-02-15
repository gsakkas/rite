
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
