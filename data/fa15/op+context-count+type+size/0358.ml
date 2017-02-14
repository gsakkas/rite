
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
(8,10)-(8,12)
(8,10)-(8,36)
(8,17)-(8,22)
(8,40)-(8,42)
(10,35)-(10,37)
(10,35)-(10,61)
(10,42)-(10,47)
(10,71)-(10,77)
*)

(* type error slice
(2,43)-(2,44)
(2,43)-(2,63)
(2,43)-(2,63)
(2,49)-(2,54)
(2,49)-(2,63)
(2,55)-(2,56)
(6,22)-(6,33)
(6,22)-(6,36)
(6,34)-(6,36)
(6,41)-(6,52)
(6,41)-(6,55)
(6,53)-(6,55)
(8,10)-(8,12)
(8,10)-(8,36)
(8,10)-(8,36)
(8,17)-(8,22)
(8,17)-(8,36)
(8,23)-(8,24)
(10,5)-(10,77)
(10,5)-(10,77)
(10,30)-(10,61)
(10,35)-(10,37)
(10,35)-(10,61)
(10,35)-(10,61)
(10,35)-(10,61)
(10,42)-(10,47)
(10,42)-(10,61)
(10,71)-(10,77)
(10,75)-(10,77)
*)
