
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 < s2
  then ((clone 0 l1), l2)
  else if s2 < s1 then (l1, (clone 0 l2)) else (l1, l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 < s2
  then (((clone 0 (s2 - s1)) @ l1), l2)
  else if s2 < s1 then (l1, ((clone 0 (s1 - s2)) @ l2)) else (l1, l2);;

*)

(* changed spans
(8,9)-(8,14)
(8,17)-(8,19)
(9,29)-(9,34)
(9,35)-(9,36)
(9,37)-(9,39)
(9,48)-(9,50)
(9,52)-(9,54)
*)

(* type error slice
(2,48)-(2,65)
(2,49)-(2,54)
(2,57)-(2,64)
(5,11)-(5,22)
(5,11)-(5,25)
(5,23)-(5,25)
(6,11)-(6,22)
(6,11)-(6,25)
(6,23)-(6,25)
(8,8)-(8,20)
(8,9)-(8,14)
(8,17)-(8,19)
(9,28)-(9,40)
(9,29)-(9,34)
(9,37)-(9,39)
*)
