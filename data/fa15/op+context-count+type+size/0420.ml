
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((clone "0" List.length l2) - (List.length l1)) :: l1
  else ((clone "0" List.length l1) - (List.length l2)) :: l2;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (((clone 0 ((List.length l1) - (List.length l2))) @ l2), l1);;

*)

(* changed spans
(6,10)-(6,15)
(6,10)-(6,34)
(6,10)-(6,53)
(6,10)-(6,61)
(6,16)-(6,19)
(6,20)-(6,31)
(7,10)-(7,15)
(7,10)-(7,34)
(7,10)-(7,53)
(7,10)-(7,61)
(7,16)-(7,19)
(7,20)-(7,31)
(7,32)-(7,34)
(7,39)-(7,50)
(7,39)-(7,53)
(7,51)-(7,53)
*)

(* type error slice
(2,50)-(2,55)
(2,50)-(2,64)
(2,59)-(2,64)
(6,10)-(6,15)
(6,10)-(6,34)
(6,20)-(6,31)
(7,10)-(7,15)
(7,10)-(7,34)
(7,20)-(7,31)
*)
