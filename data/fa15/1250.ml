
let rec clone x n = if n <= 0 then [] else [x] :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then clone (0 :: l1) (List.length l2)
    else clone (List.length l1) (0 :: l2);;


(* fix

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then ((0 :: l1), l2)
    else (l1, (0 :: l2));;

*)

(* changed spans
(9,10)-(9,42)
(0 :: l1 , l2)
TupleG [AppG [EmptyG,EmptyG],VarG]

(10,10)-(10,42)
(l1 , 0 :: l2)
TupleG [VarG,AppG [EmptyG,EmptyG]]

*)

(* type error slice
(2,44)-(2,68)
(2,51)-(2,68)
(2,52)-(2,57)
(5,3)-(10,42)
(6,8)-(6,16)
(8,5)-(10,42)
(9,10)-(9,15)
(9,10)-(9,42)
(9,16)-(9,25)
(10,10)-(10,15)
(10,10)-(10,42)
(10,16)-(10,32)
(10,17)-(10,28)
*)
