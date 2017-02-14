
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let ll1 = List.length l1
  and ll2 = List.length l2 in
  if ll1 > ll2
  then (l1, ((clone 0 (ll1 - ll2)) @ l2))
  else (((clone (0 (ll2 - ll1))) @ l1), l2);;


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
(9,9)-(9,32)
(9,16)-(9,31)
*)

(* type error slice
(8,13)-(8,34)
(8,14)-(8,19)
(9,8)-(9,38)
(9,9)-(9,32)
(9,10)-(9,15)
(9,16)-(9,31)
(9,17)-(9,18)
(9,33)-(9,34)
*)
