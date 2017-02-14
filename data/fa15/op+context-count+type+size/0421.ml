
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone "0" ((List.length l2) - (List.length l1))) :: l1
  else ((clone "0" List.length l1) - (List.length l2)) :: l2;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (((clone 0 ((List.length l1) - (List.length l2))) @ l2), l1);;

*)

(* changed spans
(6,9)-(6,14)
(6,9)-(6,63)
(6,15)-(6,18)
(7,10)-(7,15)
(7,10)-(7,34)
(7,10)-(7,53)
(7,10)-(7,61)
(7,16)-(7,19)
(7,20)-(7,31)
(7,39)-(7,50)
(7,59)-(7,61)
*)

(* type error slice
(2,50)-(2,55)
(2,50)-(2,64)
(2,59)-(2,64)
(5,3)-(7,61)
(5,3)-(7,61)
(6,9)-(6,14)
(6,9)-(6,54)
(6,9)-(6,63)
(6,9)-(6,63)
(7,10)-(7,15)
(7,10)-(7,34)
(7,10)-(7,53)
(7,10)-(7,61)
(7,10)-(7,61)
(7,20)-(7,31)
*)
