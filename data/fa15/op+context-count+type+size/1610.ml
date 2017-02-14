
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  if numZeros = 0
  then (l1, l2)
  else
    if numZeros > 0
    then (l1, ((clone (0, numZeros)) @ l2))
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
(6,3)-(11,49)
(9,5)-(11,49)
(10,17)-(10,22)
(10,17)-(10,35)
(10,24)-(10,25)
(10,24)-(10,35)
(10,27)-(10,35)
(11,13)-(11,18)
(11,13)-(11,36)
(11,20)-(11,21)
(11,20)-(11,36)
(11,24)-(11,27)
(11,24)-(11,36)
(11,28)-(11,36)
*)

(* type error slice
(2,50)-(2,55)
(2,50)-(2,64)
(10,17)-(10,22)
(10,17)-(10,35)
(10,17)-(10,42)
(10,38)-(10,39)
(11,13)-(11,18)
(11,13)-(11,36)
(11,13)-(11,44)
(11,40)-(11,41)
*)
