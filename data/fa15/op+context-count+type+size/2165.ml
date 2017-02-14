
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
(5,3)-(6,66)
(6,8)-(6,66)
*)

(* type error slice
(5,3)-(6,66)
(5,3)-(6,66)
(5,3)-(6,66)
(6,8)-(6,10)
(6,8)-(6,66)
(6,8)-(6,66)
(6,8)-(6,66)
(6,15)-(6,66)
(6,25)-(6,36)
(6,25)-(6,39)
(6,37)-(6,39)
(6,62)-(6,63)
*)
