
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
(2,4)-(5,18)
(2,15)-(5,16)
(2,17)-(5,16)
(3,3)-(5,16)
(4,29)-(4,35)
(4,29)-(4,55)
(4,36)-(4,37)
(4,39)-(4,44)
(4,47)-(4,55)
(5,3)-(5,9)
(5,3)-(5,16)
(5,10)-(5,11)
(5,12)-(5,13)
(5,14)-(5,16)
(8,14)-(8,25)
(8,14)-(8,28)
(8,26)-(8,28)
(9,14)-(9,25)
(9,14)-(9,28)
(9,26)-(9,28)
(10,3)-(12,43)
(11,8)-(11,13)
(11,8)-(11,28)
(11,14)-(11,15)
(11,17)-(11,28)
(12,11)-(12,16)
(12,11)-(12,31)
(12,11)-(12,38)
(12,11)-(12,43)
(12,17)-(12,18)
(12,20)-(12,31)
(12,34)-(12,35)
(12,36)-(12,38)
(12,41)-(12,43)
*)
