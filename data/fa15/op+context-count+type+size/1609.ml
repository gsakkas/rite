
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  if numZeros = 0
  then (l1, l2)
  else
    (let listZeros = clone (0, (abs numZeros)) in
     if numZeros > 0 then (l1, (listZeros @ l2)) else ((listZeros @ l1), l2));;


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
(6,3)-(10,76)
(9,6)-(10,76)
(9,22)-(9,27)
(9,22)-(9,45)
(9,29)-(9,45)
(9,33)-(9,36)
(9,33)-(9,45)
(9,37)-(9,45)
*)

(* type error slice
(2,50)-(2,55)
(2,50)-(2,64)
(9,6)-(10,76)
(9,22)-(9,27)
(9,22)-(9,45)
(10,33)-(10,42)
(10,33)-(10,47)
(10,43)-(10,44)
(10,57)-(10,66)
(10,57)-(10,71)
(10,67)-(10,68)
*)
