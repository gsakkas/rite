
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  if difference2 > 0
  then ((l1 :: (clone 0 difference2)), l2)
  else
    if difference1 > 0 then (l1, (l2 :: (clone 0 difference1))) else (l1, l2);;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  if difference2 > 0
  then (((clone 0 difference2) @ l1), l2)
  else
    if difference1 > 0 then (l1, ((clone 0 difference1) @ l2)) else (l1, l2);;

*)

(* changed spans
(8,16)-(8,21)
(@)
VarG

(8,16)-(8,21)
clone 0 difference2
AppG (fromList [VarG,LitG])

(8,39)-(8,41)
l1
VarG

(10,41)-(10,46)
(@)
VarG

(10,41)-(10,46)
clone 0 difference1
AppG (fromList [VarG,LitG])

(10,69)-(10,77)
l2
VarG

*)
