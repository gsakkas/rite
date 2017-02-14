
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
(3,5)-(3,40)
(4,12)-(4,14)
(7,21)-(7,30)
(7,22)-(7,23)
(8,10)-(8,14)
(8,16)-(8,20)
*)

(* type error slice
(6,4)-(8,21)
(6,4)-(8,21)
(7,9)-(7,31)
(7,21)-(7,30)
(7,21)-(7,30)
(7,27)-(7,29)
(8,9)-(8,21)
(8,16)-(8,20)
(8,16)-(8,20)
(8,17)-(8,19)
*)
