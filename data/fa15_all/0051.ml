
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
(9,10)-(9,33)
clone 0 (ll2 - ll1)
AppG (fromList [BopG EmptyG EmptyG,LitG])

*)

(* type error slice
(8,14)-(8,35)
(8,15)-(8,20)
(9,9)-(9,39)
(9,10)-(9,33)
(9,11)-(9,16)
(9,17)-(9,32)
(9,18)-(9,19)
(9,34)-(9,35)
*)
