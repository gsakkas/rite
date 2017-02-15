
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then [(l1, l2)]
  else
    (let numZeros = (List.length l1) - (List.length l2) in
     if numZeros = 0
     then [(l1, l2)]
     else
       (let listZeros = clone (0, (abs numZeros)) in
        if numZeros > 0
        then let list1 = l1 in let list2 = listZeros @ l2 in [(list1, list2)]
        else
          (let list1 = listZeros @ l1 in let list2 = l2 in [(list1, list2)])));;


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
(5,2)-(16,78)
(5,5)-(5,21)
(5,5)-(5,40)
(5,6)-(5,17)
(5,18)-(5,20)
(5,24)-(5,40)
(5,25)-(5,36)
(5,37)-(5,39)
(6,7)-(6,17)
(6,8)-(6,16)
(6,9)-(6,11)
(6,13)-(6,15)
(8,4)-(16,78)
(9,5)-(16,77)
(10,10)-(10,20)
(12,7)-(16,77)
(12,24)-(12,29)
(12,24)-(12,49)
(12,30)-(12,49)
(12,34)-(12,48)
(12,35)-(12,38)
(12,39)-(12,47)
(14,13)-(14,77)
(14,31)-(14,77)
(16,10)-(16,76)
*)

(* type error slice
(2,48)-(2,65)
(2,49)-(2,54)
(12,7)-(16,77)
(12,24)-(12,29)
(12,24)-(12,49)
(14,43)-(14,52)
(14,43)-(14,57)
(14,53)-(14,54)
(16,23)-(16,32)
(16,23)-(16,37)
(16,33)-(16,34)
*)
