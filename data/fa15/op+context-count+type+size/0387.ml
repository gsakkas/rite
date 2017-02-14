
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
(9,11)-(9,30)
(9,18)-(9,30)
*)

(* type error slice
(8,15)-(8,20)
(8,15)-(8,33)
(9,11)-(9,16)
(9,11)-(9,30)
(9,11)-(9,38)
(9,18)-(9,19)
(9,18)-(9,30)
(9,34)-(9,35)
*)
