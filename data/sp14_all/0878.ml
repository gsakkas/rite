
let rec clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then clone 0 (len1 - len2)
  else (((clone 0 (len2 - len1)) @ l1), l2);;


(* fix

let rec clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (((clone 0 (len1 - len2)) @ l2), l1)
  else (((clone 0 (len2 - len1)) @ l1), l2);;

*)

(* changed spans
(11,8)-(11,29)
(clone 0
       (len1 - len2) @ l2 , l1)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* type error slice
(10,3)-(12,44)
(11,8)-(11,13)
(11,8)-(11,29)
(12,8)-(12,44)
(12,9)-(12,39)
(12,10)-(12,33)
(12,11)-(12,16)
(12,34)-(12,35)
*)
