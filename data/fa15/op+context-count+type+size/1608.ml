
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  let listZeros = clone (0, (abs numZeros)) in
  if numZeros > 0 then [(l1, l2)] else [((listZeros @ l1), l2)];;


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
(6,3)-(7,64)
(6,19)-(6,24)
(6,19)-(6,42)
(6,26)-(6,27)
(6,26)-(6,42)
(7,6)-(7,18)
(7,24)-(7,34)
(7,40)-(7,64)
(7,43)-(7,57)
(7,43)-(7,62)
(7,55)-(7,57)
*)

(* type error slice
(2,50)-(2,55)
(2,50)-(2,64)
(6,3)-(7,64)
(6,19)-(6,24)
(6,19)-(6,42)
(7,43)-(7,52)
(7,43)-(7,57)
(7,53)-(7,54)
*)
