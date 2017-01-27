
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let first = List.length l1 in
  let sec = List.length l2 in
  if first < sec
  then (clone 0 (sec - first)) :: l1
  else
    if first > sec then (l1, ((clone 0 (first - sec)) :: l2)) else (l1, l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let first = List.length l1 in
  let sec = List.length l2 in
  if first < sec
  then ((List.append (clone 0 (sec - first)) l1), l2)
  else
    if first > sec
    then (l1, (List.append (clone 0 (first - sec)) l2))
    else (l1, l2);;

*)

(* changed spans
(8,9)-(8,14)
(8,9)-(8,37)
(10,5)-(10,75)
(10,32)-(10,37)
(10,32)-(10,60)
(10,69)-(10,71)
(10,73)-(10,75)
*)

(* type error slice
(5,15)-(5,26)
(5,15)-(5,29)
(5,27)-(5,29)
(7,3)-(10,75)
(8,9)-(8,37)
(10,5)-(10,75)
(10,26)-(10,28)
(10,26)-(10,60)
(10,32)-(10,60)
*)
