
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
(8,11)-(8,12)
l1
VarG

(10,4)-(12,39)
l2
VarG

(11,31)-(11,33)
a
VarG

*)
