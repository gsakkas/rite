
let sqsum xs = let f a x = a * a in let base = 0 in List.fold_right f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(2,16)-(2,78)
(2,28)-(2,29)
(2,28)-(2,33)
(2,37)-(2,78)
(2,48)-(2,49)
(2,53)-(2,68)
*)

(* type error slice
(2,37)-(2,78)
(2,48)-(2,49)
(2,53)-(2,68)
(2,53)-(2,78)
(2,71)-(2,75)
*)
