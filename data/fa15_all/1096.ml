
let sqsum xs =
  let f a x = (a * a) + xs in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,25)-(3,27)
x
VarG

*)

(* type error slice
(3,15)-(3,27)
(3,25)-(3,27)
(3,47)-(3,61)
(3,47)-(3,71)
(3,69)-(3,71)
*)
