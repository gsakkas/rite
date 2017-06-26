
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
(8,7)-(8,39)
(8,37)-(8,39)
*)

(* type error slice
(6,2)-(8,39)
(7,7)-(7,41)
(8,7)-(8,18)
(8,7)-(8,39)
*)

(* all spans
(2,14)-(2,64)
(2,16)-(2,64)
(2,20)-(2,64)
(2,23)-(2,28)
(2,23)-(2,24)
(2,27)-(2,28)
(2,34)-(2,36)
(2,42)-(2,64)
(2,42)-(2,43)
(2,47)-(2,64)
(2,48)-(2,53)
(2,54)-(2,55)
(2,56)-(2,63)
(2,57)-(2,58)
(2,61)-(2,62)
(4,12)-(8,39)
(4,15)-(8,39)
(5,2)-(8,39)
(5,10)-(5,45)
(5,10)-(5,26)
(5,11)-(5,22)
(5,23)-(5,25)
(5,29)-(5,45)
(5,30)-(5,41)
(5,42)-(5,44)
(6,2)-(8,39)
(6,5)-(6,10)
(6,5)-(6,6)
(6,9)-(6,10)
(7,7)-(7,41)
(7,8)-(7,10)
(7,12)-(7,40)
(7,13)-(7,24)
(7,25)-(7,36)
(7,26)-(7,31)
(7,32)-(7,33)
(7,34)-(7,35)
(7,37)-(7,39)
(8,7)-(8,39)
(8,7)-(8,18)
(8,19)-(8,36)
(8,20)-(8,25)
(8,26)-(8,27)
(8,28)-(8,35)
(8,29)-(8,30)
(8,33)-(8,34)
(8,37)-(8,39)
*)
