
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let a = (List.length l1) - (List.length l2) in
  if a > 0
  then (l1, (List.append (clone 0 a) l2))
  else List.append (clone 0 (0 - a)) l2;;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let a = (List.length l1) - (List.length l2) in
  if a > 0
  then (l1, (List.append (clone 0 a) l2))
  else ((List.append (clone 0 (0 - a)) l1), l2);;

*)

(* changed spans
(8,8)-(8,40)
(8,38)-(8,40)
*)

(* type error slice
(6,3)-(8,40)
(6,3)-(8,40)
(7,9)-(7,40)
(8,8)-(8,19)
(8,8)-(8,40)
*)
