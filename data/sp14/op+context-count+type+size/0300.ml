
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
(8,9)-(8,10)
(8,12)-(8,13)
(10,5)-(12,38)
(11,22)-(11,23)
(11,26)-(11,27)
(11,32)-(11,34)
*)

(* type error slice
(6,3)-(12,38)
(6,11)-(6,22)
(6,11)-(6,25)
(7,3)-(12,38)
(7,3)-(12,38)
(8,9)-(8,13)
(8,12)-(8,13)
(10,5)-(12,38)
(11,13)-(11,39)
(11,37)-(11,39)
(12,17)-(12,38)
(12,34)-(12,35)
(12,36)-(12,38)
*)
