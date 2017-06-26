
let padZero l1 l2 = if (List.length l1) = (List.length l2) then (l1, l2);;


(* fix

let padZero l1 l2 =
  if (List.length l1) = (List.length l2) then (l1, l2) else (l1, l2);;

*)

(* changed spans
(2,20)-(2,72)
*)

(* type error slice
(2,20)-(2,72)
(2,64)-(2,72)
*)

(* all spans
(2,12)-(2,72)
(2,15)-(2,72)
(2,20)-(2,72)
(2,23)-(2,58)
(2,23)-(2,39)
(2,24)-(2,35)
(2,36)-(2,38)
(2,42)-(2,58)
(2,43)-(2,54)
(2,55)-(2,57)
(2,64)-(2,72)
(2,65)-(2,67)
(2,69)-(2,71)
*)
