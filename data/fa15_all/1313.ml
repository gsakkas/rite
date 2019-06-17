
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  if difference2 > 0
  then ((l1 :: (clone 0 difference2)), l2)
  else
    if difference1 > 0 then (l1, (l2 :: (clone 0 difference1))) else (l1, l2);;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  if difference2 > 0
  then (((clone 0 difference2) @ l1), l2)
  else
    if difference1 > 0 then (l1, ((clone 0 difference1) @ l2)) else (l1, l2);;

*)

(* changed spans
(8,9)-(8,38)
clone 0 difference2 @ l1
AppG [AppG [EmptyG,EmptyG],VarG]

(10,34)-(10,63)
clone 0 difference1 @ l2
AppG [AppG [EmptyG,EmptyG],VarG]

*)

(* type error slice
(2,43)-(2,44)
(2,43)-(2,65)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(6,21)-(6,37)
(6,22)-(6,33)
(6,34)-(6,36)
(6,40)-(6,56)
(6,41)-(6,52)
(6,53)-(6,55)
(8,9)-(8,38)
(8,10)-(8,12)
(8,16)-(8,37)
(8,17)-(8,22)
(8,23)-(8,24)
(10,5)-(10,78)
(10,29)-(10,64)
(10,34)-(10,63)
(10,35)-(10,37)
(10,41)-(10,62)
(10,42)-(10,47)
(10,70)-(10,78)
(10,75)-(10,77)
*)
