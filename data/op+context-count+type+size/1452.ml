
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
(8,10)-(8,37)
(8,42)-(8,44)
*)

(* type error slice
(2,49)-(2,54)
(2,49)-(2,63)
(2,55)-(2,56)
(2,58)-(2,63)
(5,3)-(8,44)
(5,12)-(5,23)
(5,12)-(5,26)
(5,12)-(5,45)
(5,24)-(5,26)
(5,31)-(5,42)
(5,31)-(5,45)
(5,43)-(5,45)
(6,3)-(8,44)
(7,9)-(7,11)
(7,9)-(7,40)
(7,14)-(7,25)
(7,14)-(7,40)
(7,27)-(7,32)
(7,27)-(7,36)
(7,33)-(7,34)
(7,35)-(7,36)
(7,38)-(7,40)
(8,10)-(8,21)
(8,10)-(8,37)
(8,10)-(8,44)
(8,23)-(8,28)
(8,23)-(8,37)
(8,29)-(8,30)
(8,32)-(8,37)
(8,42)-(8,44)
*)
