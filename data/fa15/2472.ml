
let sqsum xs =
  let f a x = (x * x) + a in let base = [] in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (x * x) + a in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,41)-(3,43)
0
LitG

*)

(* type error slice
(3,3)-(3,71)
(3,9)-(3,26)
(3,15)-(3,26)
(3,25)-(3,26)
(3,30)-(3,71)
(3,41)-(3,43)
(3,47)-(3,61)
(3,47)-(3,71)
(3,62)-(3,63)
(3,64)-(3,68)
*)
