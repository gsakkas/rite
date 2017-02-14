
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff >= 0
  then (l1, ((clone 0 diff) @ l2))
  else ((((clone 0) - diff) @ l1), l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff >= 0
  then (l1, ((clone 0 diff) @ l2))
  else (((clone 0 (abs diff)) @ l1), l2);;

*)

(* changed spans
(8,12)-(8,19)
(8,12)-(8,27)
(8,23)-(8,27)
*)

(* type error slice
(7,15)-(7,20)
(7,15)-(7,27)
(8,12)-(8,17)
(8,12)-(8,19)
(8,12)-(8,27)
(8,12)-(8,27)
(8,12)-(8,33)
(8,29)-(8,30)
*)
