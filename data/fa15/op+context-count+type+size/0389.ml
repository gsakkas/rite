
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let ll1 = List.length l1
  and ll2 = List.length l2 in
  if ll1 > ll2
  then (l1, ((clone (0, (ll1 - ll2))) @ l2))
  else (((clone (0, (ll2 - ll1))) @ l1), l2);;


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
(8,13)-(8,37)
(8,20)-(8,36)
(9,9)-(9,33)
(9,16)-(9,32)
*)

(* type error slice
(2,48)-(2,65)
(2,49)-(2,54)
(8,12)-(8,43)
(8,13)-(8,37)
(8,14)-(8,19)
(8,38)-(8,39)
(9,8)-(9,39)
(9,9)-(9,33)
(9,10)-(9,15)
(9,34)-(9,35)
*)
