
let sqsum xs =
  let f a x = x * x in let base = f 2 xs in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = a * a in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,15)-(3,16)
a
VarG

(3,19)-(3,20)
a
VarG

(3,35)-(3,41)
0
LitG

*)

(* type error slice
(3,3)-(3,69)
(3,9)-(3,20)
(3,11)-(3,20)
(3,15)-(3,16)
(3,15)-(3,20)
(3,35)-(3,36)
(3,35)-(3,41)
(3,39)-(3,41)
(3,45)-(3,59)
(3,45)-(3,69)
(3,67)-(3,69)
*)
