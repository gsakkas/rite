
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len = (List.length l1) - (List.length l2) in
  if len <= 0
  then ((((clone 0 (-1)) * len) @ l1), l2)
  else (l1, ((clone 0 len) @ l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len = (List.length l1) - (List.length l2) in
  if len <= 0
  then (((clone 0 ((-1) * len)) @ l1), l2)
  else (l1, ((clone 0 len) @ l2));;

*)

(* changed spans
(7,12)-(7,31)
(7,21)-(7,23)
*)

(* type error slice
(2,44)-(2,64)
(2,50)-(2,55)
(2,50)-(2,64)
(7,12)-(7,17)
(7,12)-(7,23)
(7,12)-(7,31)
(7,12)-(7,31)
(7,12)-(7,37)
(7,33)-(7,34)
*)
