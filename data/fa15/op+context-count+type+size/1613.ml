
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
(5,3)-(16,76)
(5,7)-(5,18)
(5,7)-(5,21)
(5,7)-(5,40)
(5,19)-(5,21)
(5,26)-(5,37)
(5,26)-(5,40)
(5,38)-(5,40)
(6,8)-(6,18)
(6,10)-(6,12)
(6,10)-(6,16)
(6,14)-(6,16)
(8,6)-(16,76)
(9,6)-(16,76)
(10,11)-(10,21)
(12,9)-(16,76)
(12,25)-(12,30)
(12,25)-(12,48)
(12,32)-(12,48)
(12,36)-(12,39)
(12,36)-(12,48)
(12,40)-(12,48)
(14,14)-(14,78)
(16,12)-(16,76)
*)

(* type error slice
(2,50)-(2,55)
(2,50)-(2,64)
(12,9)-(16,76)
(12,25)-(12,30)
(12,25)-(12,48)
(14,44)-(14,53)
(14,44)-(14,58)
(14,54)-(14,55)
(16,24)-(16,33)
(16,24)-(16,38)
(16,34)-(16,35)
*)
