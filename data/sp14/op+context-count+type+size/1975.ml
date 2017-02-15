
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
(8,7)-(8,36)
(8,8)-(8,13)
(10,4)-(10,75)
(10,29)-(10,60)
(10,31)-(10,36)
(10,68)-(10,70)
(10,72)-(10,74)
*)

(* type error slice
(7,2)-(10,75)
(7,2)-(10,75)
(8,7)-(8,36)
(10,4)-(10,75)
(10,24)-(10,61)
*)
