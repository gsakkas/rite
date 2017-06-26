
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
(5,51)-(5,77)
*)

(* all spans
(2,12)-(5,77)
(2,15)-(5,77)
(3,2)-(5,77)
(3,5)-(3,40)
(3,5)-(3,21)
(3,6)-(3,17)
(3,18)-(3,20)
(3,24)-(3,40)
(3,25)-(3,36)
(3,37)-(3,39)
(4,7)-(4,15)
(4,8)-(4,10)
(4,12)-(4,14)
(5,7)-(5,77)
(5,10)-(5,45)
(5,10)-(5,26)
(5,11)-(5,22)
(5,23)-(5,25)
(5,29)-(5,45)
(5,30)-(5,41)
(5,42)-(5,44)
(5,51)-(5,77)
(5,52)-(5,72)
(5,53)-(5,64)
(5,65)-(5,68)
(5,66)-(5,67)
(5,69)-(5,71)
(5,74)-(5,76)
*)
