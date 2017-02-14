
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
(10,8)-(10,12)
*)

(* type error slice
(8,2)-(10,69)
(8,2)-(10,69)
(9,7)-(9,67)
(9,8)-(9,62)
(9,57)-(9,58)
(9,59)-(9,61)
(10,7)-(10,69)
(10,8)-(10,12)
(10,8)-(10,12)
(10,9)-(10,11)
*)
