
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
(11,7)-(11,12)
(11,7)-(11,28)
(12,7)-(12,43)
(12,19)-(12,23)
(12,26)-(12,30)
*)

(* type error slice
(10,2)-(12,43)
(10,2)-(12,43)
(11,7)-(11,12)
(11,7)-(11,28)
(12,7)-(12,43)
(12,8)-(12,38)
(12,9)-(12,32)
(12,10)-(12,15)
(12,33)-(12,34)
*)
