
let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then ((0 :: l1), (0 :: l2))
    else ([l1], [l2]);;


(* fix

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (0 :: l2))
  else
    if (List.length l1) < (List.length l2) then ((0 :: l1), l2) else (l1, l2);;

*)

(* changed spans
(3,7)-(3,40)
(4,13)-(4,15)
(7,23)-(7,24)
(7,23)-(7,30)
(8,11)-(8,15)
(8,17)-(8,21)
*)

(* type error slice
(3,7)-(3,18)
(3,7)-(3,21)
(3,19)-(3,21)
(3,26)-(3,37)
(3,26)-(3,40)
(3,38)-(3,40)
(6,5)-(8,21)
(7,12)-(7,19)
(7,12)-(7,30)
(7,23)-(7,30)
(8,11)-(8,15)
(8,11)-(8,21)
(8,12)-(8,14)
(8,17)-(8,21)
(8,18)-(8,20)
*)
