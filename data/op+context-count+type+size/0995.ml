
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  if lenl1 > lenl2
  then (l1, (((clone 0 lenl1) - lenl2) @ l2))
  else ((((clone 0 lenl2) - lenl1) @ l1), l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  if lenl1 > lenl2
  then (l1, ((clone 0 (lenl1 - lenl2)) @ l2))
  else (((clone 0 (lenl2 - lenl1)) @ l1), l2);;

*)

(* changed spans
(8,16)-(8,38)
(8,24)-(8,29)
(9,12)-(9,34)
(9,20)-(9,25)
*)

(* type error slice
(2,44)-(2,64)
(2,50)-(2,55)
(2,50)-(2,64)
(8,16)-(8,21)
(8,16)-(8,29)
(8,16)-(8,38)
(8,16)-(8,38)
(8,16)-(8,44)
(8,40)-(8,41)
(9,12)-(9,17)
(9,12)-(9,25)
(9,12)-(9,34)
(9,12)-(9,34)
(9,12)-(9,40)
(9,36)-(9,37)
*)
