
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
*)

(* type error slice
(8,3)-(10,68)
(8,3)-(10,68)
(9,11)-(9,62)
(9,11)-(9,67)
(9,58)-(9,59)
(9,60)-(9,62)
(10,9)-(10,13)
(10,9)-(10,13)
(10,9)-(10,68)
(10,10)-(10,12)
*)
