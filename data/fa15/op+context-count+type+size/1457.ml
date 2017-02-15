
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
(6,2)-(10,77)
(9,4)-(10,77)
(9,21)-(9,26)
(9,21)-(9,41)
(9,29)-(9,32)
(9,33)-(9,41)
*)

(* type error slice
(2,48)-(2,65)
(2,49)-(2,54)
(2,57)-(2,64)
(9,21)-(9,26)
(9,21)-(9,41)
(9,29)-(9,32)
*)
