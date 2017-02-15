
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
(6,2)-(7,63)
(6,18)-(6,23)
(6,18)-(6,43)
(6,24)-(6,43)
(6,25)-(6,26)
(7,5)-(7,17)
(7,23)-(7,33)
(7,39)-(7,63)
(7,40)-(7,62)
(7,41)-(7,57)
(7,54)-(7,56)
*)

(* type error slice
(2,48)-(2,65)
(2,49)-(2,54)
(6,2)-(7,63)
(6,18)-(6,23)
(6,18)-(6,43)
(7,41)-(7,57)
(7,42)-(7,51)
(7,52)-(7,53)
*)
