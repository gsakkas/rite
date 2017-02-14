
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
(8,13)-(8,38)
(8,23)-(8,28)
(9,9)-(9,34)
(9,19)-(9,24)
*)

(* type error slice
(2,43)-(2,65)
(2,48)-(2,65)
(2,49)-(2,54)
(8,12)-(8,44)
(8,13)-(8,38)
(8,13)-(8,38)
(8,14)-(8,29)
(8,15)-(8,20)
(8,39)-(8,40)
(9,8)-(9,40)
(9,9)-(9,34)
(9,9)-(9,34)
(9,10)-(9,25)
(9,11)-(9,16)
(9,35)-(9,36)
*)
