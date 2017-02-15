
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
(8,9)-(8,27)
(8,10)-(8,19)
(8,22)-(8,26)
*)

(* type error slice
(7,13)-(7,27)
(7,14)-(7,19)
(8,8)-(8,33)
(8,9)-(8,27)
(8,9)-(8,27)
(8,10)-(8,19)
(8,11)-(8,16)
(8,28)-(8,29)
*)
