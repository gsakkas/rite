
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
(8,9)-(8,14)
(@)
VarG

(8,9)-(8,14)
clone 0 (s2 - s1)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(8,17)-(8,19)
s2
VarG

(8,17)-(8,19)
s1
VarG

(8,17)-(8,19)
s2 - s1
BopG VarG VarG

(9,29)-(9,34)
(@)
VarG

(9,29)-(9,34)
clone 0 (s1 - s2)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(9,37)-(9,39)
s1
VarG

(9,37)-(9,39)
s2
VarG

(9,37)-(9,39)
s1 - s2
BopG VarG VarG

*)
