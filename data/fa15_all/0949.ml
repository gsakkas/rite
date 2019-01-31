
let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_right f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,45)-(3,60)
List.fold_left
VarG

*)
