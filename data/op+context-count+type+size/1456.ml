
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let a = (List.length l1) - (List.length l2) in
  if a > 0
  then (l1, (List.append (clone 0 a) l2))
  else ((List.append (clone 0 (0 - a))), l2);;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let a = (List.length l1) - (List.length l2) in
  if a > 0
  then (l1, (List.append (clone 0 a) l2))
  else ((List.append (clone 0 (0 - a)) l1), l2);;

*)

(* changed spans
(8,10)-(8,37)
(8,42)-(8,44)
*)

(* type error slice
(5,12)-(5,23)
(5,12)-(5,26)
(5,24)-(5,26)
(6,3)-(8,44)
(6,3)-(8,44)
(7,9)-(7,11)
(7,9)-(7,40)
(8,10)-(8,21)
(8,10)-(8,37)
(8,10)-(8,44)
*)
