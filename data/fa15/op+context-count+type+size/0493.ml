
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ [l1]), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ [l2]));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

*)

(* changed spans
(6,59)-(6,63)
(7,63)-(7,67)
*)

(* type error slice
(2,43)-(2,44)
(2,43)-(2,65)
(2,43)-(2,65)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(6,8)-(6,64)
(6,9)-(6,56)
(6,10)-(6,15)
(6,16)-(6,17)
(6,38)-(6,54)
(6,39)-(6,50)
(6,51)-(6,53)
(6,57)-(6,58)
(6,59)-(6,63)
(6,59)-(6,63)
(6,60)-(6,62)
(7,12)-(7,68)
(7,13)-(7,60)
(7,14)-(7,19)
(7,42)-(7,58)
(7,43)-(7,54)
(7,55)-(7,57)
(7,61)-(7,62)
(7,63)-(7,67)
(7,63)-(7,67)
(7,64)-(7,66)
*)
