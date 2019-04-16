
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let d = (List.length l1) - (List.length l2) in
  if d < 0 then (((clone 0 (0 - d)) @ l1), l2) else (l1 * (clone 0 d)) @ l2;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let d = (List.length l1) - (List.length l2) in
  if d < 0 then (((clone 0 (0 - d)) @ l1), l2) else (l1, ((clone 0 d) @ l2));;

*)

(* changed spans
(6,53)-(6,76)
(l1 , clone 0 d @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* type error slice
(2,44)-(2,66)
(2,49)-(2,66)
(2,50)-(2,55)
(6,18)-(6,42)
(6,37)-(6,38)
(6,39)-(6,41)
(6,53)-(6,71)
(6,53)-(6,76)
(6,54)-(6,56)
(6,59)-(6,70)
(6,60)-(6,65)
(6,72)-(6,73)
*)
