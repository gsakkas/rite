
let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else if (List.length l1) < (List.length l2) then ((List.append [0] l1), l2);;


(* fix

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else if (List.length l1) < (List.length l2) then (l1, l2) else (l1, l2);;

*)

(* changed spans
(5,8)-(5,77)
(5,54)-(5,65)
(5,54)-(5,72)
(5,66)-(5,69)
(5,67)-(5,68)
*)

(* type error slice
(3,7)-(3,18)
(3,7)-(3,21)
(3,19)-(3,21)
(3,26)-(3,37)
(3,26)-(3,40)
(3,38)-(3,40)
(5,8)-(5,77)
(5,54)-(5,65)
(5,54)-(5,72)
(5,54)-(5,77)
(5,66)-(5,69)
(5,67)-(5,68)
(5,70)-(5,72)
(5,75)-(5,77)
*)
