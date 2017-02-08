
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
(6,5)-(8,21)
(6,5)-(8,21)
(7,12)-(7,30)
(7,23)-(7,30)
(7,23)-(7,30)
(7,28)-(7,30)
(8,11)-(8,21)
(8,17)-(8,21)
(8,17)-(8,21)
(8,18)-(8,20)
*)
