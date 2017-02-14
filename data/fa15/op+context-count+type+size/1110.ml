
let sqsum xs =
  let f a x = a + (x * x) in
  let base = 0 "to be implemented" in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(4,2)-(4,62)
(4,13)-(4,34)
(4,15)-(4,34)
*)

(* type error slice
(4,13)-(4,14)
(4,13)-(4,34)
*)
