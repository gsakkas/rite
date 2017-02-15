
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
(8,8)-(8,39)
(8,41)-(8,43)
*)

(* type error slice
(5,10)-(5,26)
(5,11)-(5,22)
(5,23)-(5,25)
(6,2)-(8,44)
(6,2)-(8,44)
(7,7)-(7,41)
(7,8)-(7,10)
(8,7)-(8,44)
(8,8)-(8,39)
(8,9)-(8,20)
*)
