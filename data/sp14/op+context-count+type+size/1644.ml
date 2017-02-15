
let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else if (List.length l1) < (List.length l2) then ((0 :: l1), l2);;


(* fix

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else if (List.length l1) < (List.length l2) then (l1, l2) else (l1, l2);;

*)

(* changed spans
(5,7)-(5,66)
(5,52)-(5,61)
(5,53)-(5,54)
*)

(* type error slice
(5,7)-(5,66)
(5,7)-(5,66)
(5,7)-(5,66)
(5,51)-(5,66)
*)
