
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
(6,2)-(12,35)
(7,7)-(7,17)
(9,4)-(12,35)
(9,21)-(9,26)
(9,21)-(9,46)
(9,27)-(9,46)
(9,31)-(9,45)
(9,32)-(9,35)
(9,36)-(9,44)
(11,10)-(11,34)
(12,10)-(12,34)
*)

(* type error slice
(2,48)-(2,65)
(2,49)-(2,54)
(9,4)-(12,35)
(9,21)-(9,26)
(9,21)-(9,46)
(11,16)-(11,32)
(11,17)-(11,26)
(11,27)-(11,28)
(12,12)-(12,28)
(12,13)-(12,22)
(12,23)-(12,24)
*)
