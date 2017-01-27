
let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else if (List.length l1) < (List.length l2) then (([0] @ l1), l2);;


(* fix

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else if (List.length l1) < (List.length l2) then (l1, l2) else (l1, l2);;

*)

(* changed spans
(5,8)-(5,67)
(5,54)-(5,57)
(5,54)-(5,62)
(5,55)-(5,56)
(5,58)-(5,59)
*)

(* type error slice
(3,7)-(3,18)
(3,7)-(3,21)
(3,19)-(3,21)
(3,26)-(3,37)
(3,26)-(3,40)
(3,38)-(3,40)
(5,8)-(5,67)
(5,54)-(5,57)
(5,54)-(5,62)
(5,54)-(5,67)
(5,55)-(5,56)
(5,58)-(5,59)
(5,60)-(5,62)
(5,65)-(5,67)
*)
