
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
(8,16)-(8,34)
(8,24)-(8,27)
(9,11)-(9,31)
(9,19)-(9,24)
(9,19)-(9,31)
(9,21)-(9,24)
*)

(* type error slice
(2,44)-(2,64)
(2,50)-(2,55)
(2,50)-(2,64)
(8,16)-(8,21)
(8,16)-(8,27)
(8,16)-(8,34)
(8,16)-(8,34)
(8,16)-(8,40)
(8,36)-(8,37)
(9,11)-(9,16)
(9,11)-(9,31)
(9,11)-(9,38)
(9,19)-(9,20)
(9,19)-(9,24)
(9,34)-(9,35)
*)
