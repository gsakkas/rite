
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
(8,14)-(8,35)
clone 0 (ll1 - ll2)
AppG [LitG,BopG EmptyG EmptyG]

(9,10)-(9,33)
clone 0 (ll2 - ll1)
AppG [LitG,BopG EmptyG EmptyG]

*)

(* type error slice
(2,44)-(2,66)
(2,49)-(2,66)
(2,50)-(2,55)
(8,13)-(8,41)
(8,14)-(8,35)
(8,15)-(8,28)
(8,16)-(8,21)
(8,36)-(8,37)
(9,9)-(9,39)
(9,10)-(9,33)
(9,11)-(9,16)
(9,18)-(9,25)
(9,19)-(9,20)
(9,34)-(9,35)
*)
