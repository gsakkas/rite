
let padZero l1 l2 =
  if (List.length l1) = (List.length l2) then List.combine (l1, l2);;


(* fix

let padZero l1 l2 =
  if (List.length l1) = (List.length l2) then (l1, l2) else (l1, l2);;

*)

(* changed spans
(3,2)-(3,67)
(3,46)-(3,58)
(3,46)-(3,67)
*)

(* type error slice
(3,46)-(3,58)
(3,46)-(3,67)
(3,59)-(3,67)
*)

(* all spans
(2,12)-(3,67)
(2,15)-(3,67)
(3,2)-(3,67)
(3,5)-(3,40)
(3,5)-(3,21)
(3,6)-(3,17)
(3,18)-(3,20)
(3,24)-(3,40)
(3,25)-(3,36)
(3,37)-(3,39)
(3,46)-(3,67)
(3,46)-(3,58)
(3,59)-(3,67)
(3,60)-(3,62)
(3,64)-(3,66)
*)
