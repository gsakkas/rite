
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let first = List.length l1 in
  let sec = List.length l2 in
  if first < sec
  then ((List.append (clone 0 (sec - first)) l1), l2)
  else
    if first > sec
    then List.append l1 ((clone 0 (first - sec)) :: l2)
    else (l1, l2);;


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
(11,9)-(11,55)
(11,21)-(11,23)
(11,24)-(11,55)
*)

(* type error slice
(8,8)-(8,48)
(8,9)-(8,20)
(8,21)-(8,44)
(8,22)-(8,27)
(8,45)-(8,47)
(11,9)-(11,20)
(11,9)-(11,55)
(11,21)-(11,23)
(11,24)-(11,55)
(11,24)-(11,55)
(11,25)-(11,48)
(11,26)-(11,31)
*)
