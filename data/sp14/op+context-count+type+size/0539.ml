
let sqsum xs =
  let f a x = x * x in let base = f 2 xs in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = a * a in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,2)-(3,68)
(3,14)-(3,15)
(3,18)-(3,19)
(3,23)-(3,68)
(3,34)-(3,35)
(3,34)-(3,40)
(3,36)-(3,37)
(3,38)-(3,40)
(3,44)-(3,68)
*)

(* type error slice
(3,2)-(3,68)
(3,8)-(3,19)
(3,10)-(3,19)
(3,14)-(3,15)
(3,14)-(3,19)
(3,34)-(3,35)
(3,34)-(3,40)
(3,38)-(3,40)
(3,44)-(3,58)
(3,44)-(3,68)
(3,66)-(3,68)
*)
