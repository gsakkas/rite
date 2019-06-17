
let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_right f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,46)-(3,71)
List.fold_left f base xs
AppG [VarG,VarG,VarG]

*)

(* type error slice
(3,30)-(3,71)
(3,41)-(3,42)
(3,46)-(3,61)
(3,46)-(3,71)
(3,64)-(3,68)
*)
