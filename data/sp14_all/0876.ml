
let rec clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2 then (((clone 0 (len1 - len2)) @ len2), len1);;


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
(10,51)-(10,55)
l2
VarG

(10,58)-(10,62)
l1
VarG

(10,63)-(10,63)
(clone 0
       (len2 - len1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* type error slice
(9,3)-(10,63)
(9,14)-(9,25)
(9,14)-(9,28)
(10,3)-(10,63)
(10,23)-(10,63)
(10,24)-(10,56)
(10,49)-(10,50)
(10,51)-(10,55)
(10,63)-(10,63)
*)
