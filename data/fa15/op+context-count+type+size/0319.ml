
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
(8,8)-(8,37)
(8,9)-(8,11)
(8,16)-(8,21)
(8,39)-(8,41)
(10,33)-(10,62)
(10,34)-(10,36)
(10,41)-(10,46)
(10,69)-(10,77)
*)

(* type error slice
(2,42)-(2,43)
(2,42)-(2,64)
(2,42)-(2,64)
(2,47)-(2,64)
(2,48)-(2,53)
(2,54)-(2,55)
(6,20)-(6,36)
(6,21)-(6,32)
(6,33)-(6,35)
(6,39)-(6,55)
(6,40)-(6,51)
(6,52)-(6,54)
(8,8)-(8,37)
(8,8)-(8,37)
(8,9)-(8,11)
(8,15)-(8,36)
(8,16)-(8,21)
(8,22)-(8,23)
(10,4)-(10,77)
(10,4)-(10,77)
(10,28)-(10,63)
(10,33)-(10,62)
(10,33)-(10,62)
(10,33)-(10,62)
(10,34)-(10,36)
(10,40)-(10,61)
(10,41)-(10,46)
(10,69)-(10,77)
(10,74)-(10,76)
*)
