
let padZero l1 l2 = if (List.length l1) = (List.length l2) then [(l1, l2)];;


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
(2,12)-(2,74)
(2,20)-(2,74)
(2,23)-(2,39)
(2,23)-(2,58)
(2,64)-(2,74)
(2,65)-(2,73)
*)

(* type error slice
(2,20)-(2,74)
(2,20)-(2,74)
(2,20)-(2,74)
(2,64)-(2,74)
*)

(* all spans
(2,12)-(2,74)
(2,15)-(2,74)
(2,20)-(2,74)
(2,23)-(2,58)
(2,23)-(2,39)
(2,24)-(2,35)
(2,36)-(2,38)
(2,42)-(2,58)
(2,43)-(2,54)
(2,55)-(2,57)
(2,64)-(2,74)
(2,65)-(2,73)
(2,66)-(2,68)
(2,70)-(2,72)
(2,20)-(2,74)
*)
