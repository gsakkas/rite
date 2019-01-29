
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
(7,18)-(7,20)
l1
VarG

(7,18)-(7,42)
(l1 @ clone 0 (x2 - x1) , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(7,48)-(7,50)
l2
VarG

(7,48)-(7,72)
l2
VarG

(7,48)-(7,72)
l1
VarG

(7,48)-(7,72)
(l1 , l2 @ clone 0 (x1 - x2))
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)
