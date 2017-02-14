
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  if numZeros = 0
  then [(l1, l2)]
  else
    (let listZeros = clone (0, (abs numZeros)) in
     if numZeros > 0
     then [(l1, (listZeros @ l2))]
     else [((listZeros @ l1), l2)]);;


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
(6,3)-(12,35)
(7,8)-(7,18)
(9,6)-(12,35)
(9,22)-(9,27)
(9,22)-(9,45)
(9,29)-(9,45)
(9,33)-(9,36)
(9,33)-(9,45)
(9,37)-(9,45)
(11,11)-(11,35)
(12,11)-(12,35)
*)

(* type error slice
(2,50)-(2,55)
(2,50)-(2,64)
(9,6)-(12,35)
(9,22)-(9,27)
(9,22)-(9,45)
(11,18)-(11,27)
(11,18)-(11,32)
(11,28)-(11,29)
(12,14)-(12,23)
(12,14)-(12,28)
(12,24)-(12,25)
*)
