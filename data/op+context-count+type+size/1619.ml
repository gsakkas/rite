
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
(2,50)-(2,55)
(2,50)-(2,64)
(2,56)-(2,57)
(2,59)-(2,64)
(5,15)-(5,26)
(5,15)-(5,29)
(5,27)-(5,29)
(8,12)-(8,17)
(8,12)-(8,19)
(8,12)-(8,27)
(8,12)-(8,33)
(8,18)-(8,19)
(8,29)-(8,30)
(8,31)-(8,33)
*)
