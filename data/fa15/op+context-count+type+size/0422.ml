
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 ((List.length l2) - (List.length l1))) :: l1
  else (clone "0" ((List.length l1) - (List.length l2))) :: l2;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (((clone 0 ((List.length l1) - (List.length l2))) @ l2), l1);;

*)

(* changed spans
(6,9)-(6,14)
(6,9)-(6,61)
(7,9)-(7,14)
(7,9)-(7,54)
(7,9)-(7,63)
(7,15)-(7,18)
(7,40)-(7,51)
(7,61)-(7,63)
*)

(* type error slice
(6,9)-(6,14)
(6,9)-(6,52)
(6,15)-(6,16)
(7,9)-(7,14)
(7,9)-(7,54)
(7,15)-(7,18)
*)
