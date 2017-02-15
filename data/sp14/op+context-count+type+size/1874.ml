
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 < s2
  then (((clone 0 (s2 - s1)) @ l1), l2)
  else if s2 < s1 then (l1, (((clone 0 s1) - s2) @ l2)) else (l1, l2);;


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
(9,29)-(9,48)
(9,39)-(9,41)
*)

(* type error slice
(2,43)-(2,65)
(2,48)-(2,65)
(2,49)-(2,54)
(9,28)-(9,54)
(9,29)-(9,48)
(9,29)-(9,48)
(9,30)-(9,42)
(9,31)-(9,36)
(9,49)-(9,50)
*)
