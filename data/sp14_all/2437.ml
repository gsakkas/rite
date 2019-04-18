
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
(3,6)-(3,41)
List.length l1 > List.length l2
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(4,13)-(4,15)
0 :: l2
AppG (fromList [VarG,LitG])

(7,22)-(7,31)
l2
VarG

(8,11)-(8,15)
l1
VarG

(8,17)-(8,21)
l2
VarG

*)

(* type error slice
(6,5)-(8,22)
(7,10)-(7,32)
(7,22)-(7,31)
(7,28)-(7,30)
(8,10)-(8,22)
(8,17)-(8,21)
(8,18)-(8,20)
*)
