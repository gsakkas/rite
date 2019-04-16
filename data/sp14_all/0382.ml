
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
(8,14)-(8,39)
clone 0 (lenl1 - lenl2)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(9,10)-(9,35)
clone 0 (lenl2 - lenl1)
AppG (fromList [BopG EmptyG EmptyG,LitG])

*)

(* type error slice
(2,44)-(2,66)
(2,49)-(2,66)
(2,50)-(2,55)
(8,13)-(8,45)
(8,14)-(8,39)
(8,15)-(8,30)
(8,16)-(8,21)
(8,40)-(8,41)
(9,9)-(9,41)
(9,10)-(9,35)
(9,11)-(9,26)
(9,12)-(9,17)
(9,36)-(9,37)
*)
