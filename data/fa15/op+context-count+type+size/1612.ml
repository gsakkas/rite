
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
(6,2)-(12,77)
(7,7)-(7,17)
(9,4)-(12,77)
(9,21)-(9,26)
(9,21)-(9,46)
(9,27)-(9,46)
(9,31)-(9,45)
(9,32)-(9,35)
(9,36)-(9,44)
(11,10)-(11,74)
(11,28)-(11,74)
(11,58)-(11,74)
(11,60)-(11,65)
(11,67)-(11,72)
(12,10)-(12,76)
(12,41)-(12,75)
*)

(* type error slice
(2,48)-(2,65)
(2,49)-(2,54)
(9,4)-(12,77)
(9,21)-(9,26)
(9,21)-(9,46)
(11,40)-(11,49)
(11,40)-(11,54)
(11,50)-(11,51)
(12,23)-(12,32)
(12,23)-(12,37)
(12,33)-(12,34)
*)
