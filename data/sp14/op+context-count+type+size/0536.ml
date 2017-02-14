
let sqsum xs =
  let f a x = a ** 2 in let base = f 2 xs in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = a in let base = f 2 xs in List.fold_left f base xs;;

*)

(* changed spans
(3,2)-(3,69)
(3,14)-(3,20)
(3,16)-(3,18)
(3,19)-(3,20)
(3,24)-(3,69)
*)

(* type error slice
(3,2)-(3,69)
(3,8)-(3,20)
(3,14)-(3,15)
(3,14)-(3,20)
(3,16)-(3,18)
(3,19)-(3,20)
(3,35)-(3,36)
(3,35)-(3,41)
(3,37)-(3,38)
*)
