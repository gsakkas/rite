
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  if numZeros = 0
  then [(l1, l2)]
  else
    (let listZeros = clone (0, (abs numZeros)) in
     if numZeros > 0
     then let list1 = l1 in let list2 = listZeros @ l2 in [(list1, list2)]
     else (let list1 = listZeros @ l1 in let list2 = l2 in [(list1, list2)]));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  let absNumZeros = abs numZeros in
  if numZeros = 0
  then (l1, l2)
  else
    (let listZeros = clone 0 absNumZeros in
     if numZeros > 0 then (l1, (listZeros @ l2)) else ((listZeros @ l1), l2));;

*)

(* changed spans
(6,3)-(12,76)
(7,8)-(7,18)
(9,6)-(12,76)
(9,22)-(9,27)
(9,22)-(9,45)
(9,29)-(9,45)
(9,33)-(9,36)
(9,33)-(9,45)
(9,37)-(9,45)
(11,11)-(11,75)
(11,29)-(11,75)
(11,59)-(11,75)
(11,61)-(11,66)
(11,68)-(11,73)
(12,12)-(12,76)
(12,42)-(12,76)
*)

(* type error slice
(2,50)-(2,55)
(2,50)-(2,64)
(9,6)-(12,76)
(9,22)-(9,27)
(9,22)-(9,45)
(11,41)-(11,50)
(11,41)-(11,55)
(11,51)-(11,52)
(12,24)-(12,33)
(12,24)-(12,38)
(12,34)-(12,35)
*)
