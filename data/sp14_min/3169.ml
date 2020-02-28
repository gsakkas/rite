
let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else ([l1], ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;


(* fix

let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

*)

(* changed spans
(10,9)-(10,13)
l1
VarG

*)

(* type error slice
(8,3)-(10,70)
(9,8)-(9,68)
(9,9)-(9,63)
(9,58)-(9,59)
(9,60)-(9,62)
(10,8)-(10,70)
(10,9)-(10,13)
(10,10)-(10,12)
*)
