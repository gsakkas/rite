
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then l1 * ((clone 0 ((List.length l1) - (List.length l2))) @ l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

*)

(* changed spans
(5,2)-(6,66)
(6,7)-(6,66)
*)

(* type error slice
(5,2)-(6,66)
(5,2)-(6,66)
(5,2)-(6,66)
(6,7)-(6,9)
(6,7)-(6,66)
(6,7)-(6,66)
(6,7)-(6,66)
(6,12)-(6,66)
(6,23)-(6,39)
(6,24)-(6,35)
(6,36)-(6,38)
(6,61)-(6,62)
*)
