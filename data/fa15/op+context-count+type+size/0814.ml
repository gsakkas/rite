
let pipe fs =
  let f a x result x = a x in let base = 1 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x n = x (a n) in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,26)
(3,19)-(3,26)
(3,23)-(3,24)
(3,30)-(3,70)
(3,41)-(3,42)
(3,46)-(3,70)
*)

(* type error slice
(3,2)-(3,70)
(3,8)-(3,26)
(3,10)-(3,26)
(3,12)-(3,26)
(3,19)-(3,26)
(3,23)-(3,24)
(3,23)-(3,26)
(3,46)-(3,60)
(3,46)-(3,70)
(3,61)-(3,62)
*)
