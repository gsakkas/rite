
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
(11,8)-(11,13)
(11,8)-(11,28)
(12,11)-(12,43)
(12,20)-(12,24)
(12,27)-(12,31)
*)

(* type error slice
(10,3)-(12,43)
(10,3)-(12,43)
(11,8)-(11,13)
(11,8)-(11,28)
(12,11)-(12,16)
(12,11)-(12,31)
(12,11)-(12,38)
(12,11)-(12,43)
(12,34)-(12,35)
*)
