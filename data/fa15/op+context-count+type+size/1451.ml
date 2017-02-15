
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
(6,2)-(10,77)
(9,4)-(10,77)
(9,21)-(9,26)
(9,21)-(9,46)
(9,27)-(9,46)
(9,31)-(9,45)
(9,32)-(9,35)
(9,36)-(9,44)
*)

(* type error slice
(2,48)-(2,65)
(2,49)-(2,54)
(9,4)-(10,77)
(9,21)-(9,26)
(9,21)-(9,46)
(10,31)-(10,47)
(10,32)-(10,41)
(10,42)-(10,43)
(10,55)-(10,71)
(10,56)-(10,65)
(10,66)-(10,67)
*)
