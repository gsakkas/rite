
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  let listZeros = clone (0, (abs numZeros)) in
  if numZeros > 0 then [(l1, (listZeros @ l2))] else [((listZeros @ l1), l2)];;


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
(6,3)-(7,78)
(6,19)-(6,24)
(6,19)-(6,42)
(6,26)-(6,27)
(6,26)-(6,42)
(7,6)-(7,18)
(7,24)-(7,48)
(7,31)-(7,40)
(7,31)-(7,45)
(7,41)-(7,42)
(7,54)-(7,78)
(7,57)-(7,71)
(7,57)-(7,76)
(7,69)-(7,71)
*)

(* type error slice
(2,50)-(2,55)
(2,50)-(2,64)
(6,3)-(7,78)
(6,19)-(6,24)
(6,19)-(6,42)
(7,31)-(7,40)
(7,31)-(7,45)
(7,41)-(7,42)
(7,57)-(7,66)
(7,57)-(7,71)
(7,67)-(7,68)
*)
