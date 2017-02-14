
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
(4,14)-(4,16)
(4,20)-(4,21)
(6,5)-(6,77)
*)

(* type error slice
(3,3)-(6,77)
(3,3)-(6,77)
(4,9)-(4,21)
(4,14)-(4,16)
(4,14)-(4,21)
(4,14)-(4,21)
(4,14)-(4,21)
(4,20)-(4,21)
(6,5)-(6,77)
(6,51)-(6,63)
(6,61)-(6,63)
*)
