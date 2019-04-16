
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2 then x1 @ (clone 0 (x2 - x1)) else x2 @ (clone 0 (x1 - x2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then ((l1 @ (clone 0 (x2 - x1))), l2)
  else (l1, (l2 @ (clone 0 (x1 - x2))));;

*)

(* changed spans
(7,19)-(7,43)
(l1 @ clone 0 (x2 - x1) , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(7,49)-(7,73)
(l1 , l2 @ clone 0 (x1 - x2))
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* type error slice
(5,3)-(7,73)
(5,12)-(5,23)
(5,12)-(5,26)
(6,3)-(7,73)
(6,12)-(6,23)
(6,12)-(6,26)
(7,19)-(7,21)
(7,19)-(7,43)
(7,22)-(7,23)
(7,49)-(7,51)
(7,49)-(7,73)
(7,52)-(7,53)
*)
