
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
(2,49)-(2,54)
(2,49)-(2,63)
(2,55)-(2,56)
(2,58)-(2,63)
(5,3)-(8,40)
(5,12)-(5,23)
(5,12)-(5,26)
(5,12)-(5,45)
(5,24)-(5,26)
(5,31)-(5,42)
(5,31)-(5,45)
(5,43)-(5,45)
(6,3)-(8,40)
(7,9)-(7,11)
(7,9)-(7,40)
(7,14)-(7,25)
(7,14)-(7,40)
(7,27)-(7,32)
(7,27)-(7,36)
(7,33)-(7,34)
(7,35)-(7,36)
(7,38)-(7,40)
(8,8)-(8,19)
(8,8)-(8,40)
(8,21)-(8,26)
(8,21)-(8,35)
(8,27)-(8,28)
(8,30)-(8,35)
(8,38)-(8,40)
*)
