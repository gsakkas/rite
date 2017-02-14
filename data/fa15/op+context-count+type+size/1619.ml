
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  if numZeros = 0
  then (l1, l2)
  else
    if numZeros > 0
    then (l1, ((clone (0, (abs numZeros))) @ l2))
    else (((clone (0, (abs numZeros))) @ l1), l2);;


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
(6,2)-(11,49)
(9,4)-(11,49)
(10,15)-(10,42)
(10,16)-(10,21)
(10,22)-(10,41)
(10,23)-(10,24)
(10,26)-(10,40)
(10,27)-(10,30)
(10,31)-(10,39)
(11,11)-(11,38)
(11,12)-(11,17)
(11,18)-(11,37)
(11,19)-(11,20)
(11,22)-(11,36)
(11,23)-(11,26)
(11,27)-(11,35)
*)

(* type error slice
(2,48)-(2,65)
(2,49)-(2,54)
(10,14)-(10,48)
(10,15)-(10,42)
(10,16)-(10,21)
(10,43)-(10,44)
(11,10)-(11,44)
(11,11)-(11,38)
(11,12)-(11,17)
(11,39)-(11,40)
*)
