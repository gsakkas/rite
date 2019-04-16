
let sqsum xs =
  let f a x = a ** 2 in let base = f 2 xs in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = a in let base = f 2 xs in List.fold_left f base xs;;

*)

(* changed spans
(3,15)-(3,21)
a
VarG

*)

(* type error slice
(3,3)-(3,70)
(3,9)-(3,21)
(3,15)-(3,16)
(3,15)-(3,21)
(3,17)-(3,19)
(3,20)-(3,21)
(3,36)-(3,37)
(3,36)-(3,42)
(3,38)-(3,39)
*)
