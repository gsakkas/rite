
let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  if numZeros = 0 then (l1, l2);;


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
(2,12)-(4,31)
(4,2)-(4,31)
*)

(* type error slice
(4,2)-(4,31)
(4,23)-(4,31)
*)

(* all spans
(2,12)-(4,31)
(2,15)-(4,31)
(3,2)-(4,31)
(3,17)-(3,52)
(3,17)-(3,33)
(3,18)-(3,29)
(3,30)-(3,32)
(3,36)-(3,52)
(3,37)-(3,48)
(3,49)-(3,51)
(4,2)-(4,31)
(4,5)-(4,17)
(4,5)-(4,13)
(4,16)-(4,17)
(4,23)-(4,31)
(4,24)-(4,26)
(4,28)-(4,30)
*)
