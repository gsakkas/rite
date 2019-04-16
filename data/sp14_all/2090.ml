
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) > (List.length l2)
    then (let y = clone l1 ((List.length l1) - (List.length l2)) in (y, l2))
    else (let z = clone l2 ((List.length l2) - (List.length l1)) in (z, l1));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) > (List.length l2)
    then
      (let y = clone (List.hd l1) ((List.length l1) - (List.length l2)) in
       (y, l2))
    else
      (let z = clone (List.hd l2) ((List.length l2) - (List.length l1)) in
       (z, l1));;

*)

(* changed spans
(9,25)-(9,27)
List.hd l1
AppG (fromList [VarG])

(10,25)-(10,27)
List.hd l2
AppG (fromList [VarG])

*)

(* type error slice
(2,44)-(2,45)
(2,44)-(2,66)
(2,49)-(2,66)
(2,50)-(2,55)
(2,56)-(2,57)
(5,3)-(10,77)
(6,8)-(6,16)
(6,9)-(6,11)
(8,5)-(10,77)
(9,19)-(9,24)
(9,19)-(9,65)
(9,25)-(9,27)
(10,10)-(10,77)
(10,19)-(10,24)
(10,19)-(10,65)
(10,69)-(10,76)
(10,70)-(10,71)
*)
