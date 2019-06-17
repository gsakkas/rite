
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 < s2
  then ((clone 0 l1), l2)
  else if s2 < s1 then (l1, (clone 0 l2)) else (l1, l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 < s2
  then (((clone 0 (s2 - s1)) @ l1), l2)
  else if s2 < s1 then (l1, ((clone 0 (s1 - s2)) @ l2)) else (l1, l2);;

*)

(* changed spans
(8,9)-(8,21)
clone 0 (s2 - s1) @ l1
AppG [AppG [EmptyG,EmptyG],VarG]

(9,29)-(9,41)
clone 0 (s1 - s2) @ l2
AppG [AppG [EmptyG,EmptyG],VarG]

*)

(* type error slice
(2,49)-(2,66)
(2,50)-(2,55)
(2,58)-(2,65)
(5,12)-(5,23)
(5,12)-(5,26)
(5,24)-(5,26)
(6,12)-(6,23)
(6,12)-(6,26)
(6,24)-(6,26)
(8,9)-(8,21)
(8,10)-(8,15)
(8,18)-(8,20)
(9,29)-(9,41)
(9,30)-(9,35)
(9,38)-(9,40)
*)
