
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
(8,8)-(8,37)
(List.append (clone 0
                    (sec - first)) l1 , l2)
TupleG [AppG [EmptyG,EmptyG],VarG]

(10,30)-(10,61)
List.append (clone 0
                   (first - sec)) l2
AppG [AppG [EmptyG,EmptyG],VarG]

*)

(* type error slice
(7,3)-(10,76)
(8,8)-(8,37)
(10,5)-(10,76)
(10,68)-(10,76)
*)
