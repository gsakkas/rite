
let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (l2 :: 0))
  else
    if (List.length l1) < (List.length l2) then ((0 :: l1), l2) else (l1, l2);;


(* fix

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (0 :: l2))
  else
    if (List.length l1) < (List.length l2) then ((0 :: l1), l2) else (l1, l2);;

*)

(* changed spans
(4,13)-(4,15)
(4,19)-(4,20)
(6,4)-(6,77)
*)

(* type error slice
(3,2)-(6,77)
(3,2)-(6,77)
(4,7)-(4,22)
(4,12)-(4,21)
(4,12)-(4,21)
(4,12)-(4,21)
(4,13)-(4,15)
(4,19)-(4,20)
(6,4)-(6,77)
(6,48)-(6,63)
(6,60)-(6,62)
*)
