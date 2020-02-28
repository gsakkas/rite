
let sqsum xs =
  let f a x = ((+) a) * a in let base = f 2 xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in let base = f 9 xs in List.fold_left f base xs;;

*)

(* changed spans
(3,15)-(3,22)
a
VarG

(3,43)-(3,44)
9
LitG

*)

(* type error slice
(3,15)-(3,22)
(3,15)-(3,26)
(3,16)-(3,19)
(3,41)-(3,42)
(3,41)-(3,47)
(3,45)-(3,47)
(3,51)-(3,65)
(3,51)-(3,75)
(3,66)-(3,67)
(3,73)-(3,75)
*)
