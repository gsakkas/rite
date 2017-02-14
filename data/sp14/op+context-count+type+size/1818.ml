
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
(5,7)-(5,77)
(5,52)-(5,72)
(5,53)-(5,64)
(5,65)-(5,68)
(5,66)-(5,67)
*)

(* type error slice
(5,7)-(5,77)
(5,7)-(5,77)
(5,7)-(5,77)
(5,51)-(5,77)
*)
