
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let a = List.length l1 in
  let b = List.length l2 in
  if a = b
  then (a, b)
  else
    if a < b
    then (((clone 0 (a - b)) @ l1), l2)
    else (l1, ((clone 0 (a - b)) @ l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let a = List.length l1 in
  let b = List.length l2 in
  if a = b
  then (l1, l2)
  else
    if a < b
    then (((clone 0 (b - a)) @ l1), l2)
    else (l1, ((clone 0 (a - b)) @ l2));;

*)

(* changed spans
(8,8)-(8,9)
(8,11)-(8,12)
(10,4)-(12,39)
(11,21)-(11,22)
(11,31)-(11,33)
*)

(* type error slice
(6,2)-(12,39)
(6,10)-(6,21)
(6,10)-(6,24)
(7,2)-(12,39)
(7,2)-(12,39)
(8,7)-(8,13)
(8,11)-(8,12)
(10,4)-(12,39)
(11,9)-(11,39)
(11,36)-(11,38)
(12,14)-(12,38)
(12,33)-(12,34)
(12,35)-(12,37)
*)
