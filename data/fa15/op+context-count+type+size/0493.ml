
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
(6,60)-(6,64)
(7,64)-(7,68)
*)

(* type error slice
(2,44)-(2,45)
(2,44)-(2,64)
(2,44)-(2,64)
(2,50)-(2,55)
(2,50)-(2,64)
(2,56)-(2,57)
(6,11)-(6,16)
(6,11)-(6,54)
(6,11)-(6,64)
(6,17)-(6,18)
(6,40)-(6,51)
(6,40)-(6,54)
(6,52)-(6,54)
(6,58)-(6,59)
(6,60)-(6,64)
(6,60)-(6,64)
(6,61)-(6,63)
(7,15)-(7,20)
(7,15)-(7,58)
(7,15)-(7,68)
(7,44)-(7,55)
(7,44)-(7,58)
(7,56)-(7,58)
(7,62)-(7,63)
(7,64)-(7,68)
(7,64)-(7,68)
(7,65)-(7,67)
*)
