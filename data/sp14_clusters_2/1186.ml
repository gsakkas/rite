
let sqsum xs =
  let f a x = (a * a) + x in let base = [] in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,40)-(3,42)
0
LitG

*)
