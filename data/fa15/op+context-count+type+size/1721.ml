
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
(7,9)-(7,31)
(7,19)-(7,23)
*)

(* type error slice
(2,43)-(2,65)
(2,48)-(2,65)
(2,49)-(2,54)
(7,8)-(7,37)
(7,9)-(7,31)
(7,9)-(7,31)
(7,10)-(7,24)
(7,11)-(7,16)
(7,32)-(7,33)
*)
