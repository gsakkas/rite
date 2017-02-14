
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n > 0 then (clone 0 n) @ l2 else ((clone 0) - (1 * n)) @ l1;;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n > 0 then (l1, ((clone 0 n) @ l2)) else (((clone 0 (0 - n)) @ l1), l2);;

*)

(* changed spans
(6,16)-(6,32)
(6,38)-(6,59)
(6,38)-(6,64)
(6,39)-(6,48)
(6,51)-(6,58)
(6,52)-(6,53)
(6,56)-(6,57)
*)

(* type error slice
(6,16)-(6,27)
(6,17)-(6,22)
(6,38)-(6,59)
(6,38)-(6,59)
(6,38)-(6,64)
(6,39)-(6,48)
(6,40)-(6,45)
(6,60)-(6,61)
*)
