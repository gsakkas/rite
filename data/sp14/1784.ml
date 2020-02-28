
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
(11,10)-(11,56)
(l1 , List.append (clone 0
                         (first - sec)) l2)
TupleG [VarG,AppG [EmptyG,EmptyG]]

*)

(* type error slice
(8,9)-(8,49)
(8,10)-(8,21)
(8,22)-(8,45)
(8,23)-(8,28)
(8,46)-(8,48)
(11,10)-(11,21)
(11,10)-(11,56)
(11,22)-(11,24)
(11,25)-(11,56)
(11,26)-(11,49)
(11,27)-(11,32)
*)
