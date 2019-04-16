
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
0
LitG

(4,20)-(4,21)
l2
VarG

*)

(* type error slice
(3,3)-(6,78)
(4,8)-(4,23)
(4,13)-(4,22)
(4,14)-(4,16)
(4,20)-(4,21)
(6,5)-(6,78)
(6,70)-(6,78)
(6,75)-(6,77)
*)
