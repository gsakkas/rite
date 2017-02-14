
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  if numZeros = 0
  then (l1, l2)
  else
    (let listZeros = clone 0 abs numZeros in
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
(9,22)-(9,42)
(9,30)-(9,33)
(9,34)-(9,42)
*)

(* type error slice
(2,50)-(2,55)
(2,50)-(2,64)
(2,59)-(2,64)
(9,22)-(9,27)
(9,22)-(9,42)
(9,30)-(9,33)
*)
