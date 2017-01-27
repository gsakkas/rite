
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  if lenl1 > lenl2
  then (l1, (((clone 0 lenl1) - lenl2) @ l2))
  else ((((clone 0 lenl2) - lenl1) @ l1), l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  if lenl1 > lenl2
  then (l1, ((clone 0 (lenl1 - lenl2)) @ l2))
  else (((clone 0 (lenl2 - lenl1)) @ l1), l2);;

*)

(* changed spans
(8,16)-(8,38)
(8,24)-(8,29)
(9,12)-(9,34)
(9,20)-(9,25)
*)

(* type error slice
(2,50)-(2,55)
(2,50)-(2,64)
(2,56)-(2,57)
(2,59)-(2,64)
(5,3)-(9,45)
(5,15)-(5,26)
(5,15)-(5,29)
(5,27)-(5,29)
(6,3)-(9,45)
(6,15)-(6,26)
(6,15)-(6,29)
(6,27)-(6,29)
(8,16)-(8,21)
(8,16)-(8,29)
(8,16)-(8,38)
(8,16)-(8,44)
(8,22)-(8,23)
(8,24)-(8,29)
(8,40)-(8,41)
(8,42)-(8,44)
(9,12)-(9,17)
(9,12)-(9,25)
(9,12)-(9,34)
(9,12)-(9,40)
(9,18)-(9,19)
(9,20)-(9,25)
(9,36)-(9,37)
(9,38)-(9,40)
*)
