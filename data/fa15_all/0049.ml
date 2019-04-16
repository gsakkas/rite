
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
(8,14)-(8,38)
clone 0 (ll1 - ll2)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(9,10)-(9,34)
clone 0 (ll2 - ll1)
AppG (fromList [BopG EmptyG EmptyG,LitG])

*)

(* type error slice
(2,49)-(2,66)
(2,50)-(2,55)
(8,13)-(8,44)
(8,14)-(8,38)
(8,15)-(8,20)
(8,39)-(8,40)
(9,9)-(9,40)
(9,10)-(9,34)
(9,11)-(9,16)
(9,35)-(9,36)
*)
