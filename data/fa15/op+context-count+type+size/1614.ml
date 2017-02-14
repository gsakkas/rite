
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  if numZeros = 0
  then (l1, l2)
  else
    if numZeros > 0
    then (l1, ((clone 0 numZeros) @ l2))
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
(10,15)-(10,33)
(10,16)-(10,21)
(10,22)-(10,23)
(10,24)-(10,32)
(11,11)-(11,38)
(11,12)-(11,17)
(11,18)-(11,37)
(11,19)-(11,20)
(11,22)-(11,36)
(11,23)-(11,26)
(11,27)-(11,35)
*)

(* type error slice
(10,15)-(10,33)
(10,16)-(10,21)
(10,22)-(10,23)
(11,11)-(11,38)
(11,12)-(11,17)
(11,18)-(11,37)
*)
