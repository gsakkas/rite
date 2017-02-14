
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
(10,2)-(10,62)
(10,50)-(10,54)
(10,57)-(10,61)
*)

(* type error slice
(9,2)-(10,62)
(9,13)-(9,24)
(9,13)-(9,27)
(10,2)-(10,62)
(10,2)-(10,62)
(10,2)-(10,62)
(10,22)-(10,62)
(10,23)-(10,55)
(10,48)-(10,49)
(10,50)-(10,54)
*)
