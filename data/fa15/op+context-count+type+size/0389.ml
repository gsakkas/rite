
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
(8,15)-(8,35)
(8,22)-(8,35)
(9,11)-(9,31)
(9,18)-(9,31)
*)

(* type error slice
(2,50)-(2,55)
(2,50)-(2,64)
(8,15)-(8,20)
(8,15)-(8,35)
(8,15)-(8,43)
(8,39)-(8,40)
(9,11)-(9,16)
(9,11)-(9,31)
(9,11)-(9,39)
(9,35)-(9,36)
*)
