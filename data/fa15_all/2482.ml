
let sqsum xs =
  let f a x = a + (x * x) in
  let base = 0 "to be implemented" in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(4,14)-(4,35)
0
LitG

*)

(* type error slice
(4,14)-(4,15)
(4,14)-(4,35)
*)
