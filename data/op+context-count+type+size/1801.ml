
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
(5,8)-(5,66)
(5,54)-(5,55)
(5,54)-(5,61)
*)

(* type error slice
(3,26)-(3,37)
(3,26)-(3,40)
(3,38)-(3,40)
(5,8)-(5,66)
(5,54)-(5,61)
(5,54)-(5,66)
(5,64)-(5,66)
*)
