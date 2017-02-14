
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let ll1 = List.length l1
  and ll2 = List.length l2 in
  if ll1 > ll2
  then (l1, (((clone 0 ll1) - ll2) @ l2))
  else (((clone ((0 ll2) - ll1)) @ l1), l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let ll1 = List.length l1
  and ll2 = List.length l2 in
  if ll1 > ll2
  then (l1, ((clone 0 (ll1 - ll2)) @ l2))
  else (((clone 0 (ll2 - ll1)) @ l1), l2);;

*)

(* changed spans
(8,13)-(8,34)
(8,23)-(8,26)
(9,9)-(9,32)
(9,16)-(9,31)
(9,17)-(9,24)
(9,20)-(9,23)
*)

(* type error slice
(2,43)-(2,65)
(2,48)-(2,65)
(2,49)-(2,54)
(8,12)-(8,40)
(8,13)-(8,34)
(8,13)-(8,34)
(8,14)-(8,27)
(8,15)-(8,20)
(8,35)-(8,36)
(9,8)-(9,38)
(9,9)-(9,32)
(9,10)-(9,15)
(9,17)-(9,24)
(9,18)-(9,19)
(9,33)-(9,34)
*)
