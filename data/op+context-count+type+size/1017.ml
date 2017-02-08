
let pipe fs =
  let f a x = x a in let base a = fs a in List.fold_left f base fs;;


(* fix

let pipe fs p = let f a x = x a in let base = p in List.fold_left f base fs;;

*)

(* changed spans
(3,3)-(3,67)
(3,9)-(3,18)
(3,22)-(3,67)
(3,31)-(3,39)
(3,35)-(3,37)
(3,35)-(3,39)
(3,38)-(3,39)
(3,43)-(3,67)
*)

(* type error slice
(3,35)-(3,37)
(3,35)-(3,39)
(3,43)-(3,57)
(3,43)-(3,67)
(3,65)-(3,67)
*)
