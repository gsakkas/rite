
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
(9,11)-(9,75)
(9,25)-(9,27)
(10,11)-(10,75)
(10,25)-(10,27)
(10,70)-(10,71)
(10,73)-(10,75)
*)

(* type error slice
(2,44)-(2,45)
(2,44)-(2,64)
(2,44)-(2,64)
(2,50)-(2,55)
(2,50)-(2,64)
(2,56)-(2,57)
(5,3)-(10,75)
(5,3)-(10,75)
(6,9)-(6,11)
(6,9)-(6,15)
(8,5)-(10,75)
(9,11)-(9,75)
(9,11)-(9,75)
(9,19)-(9,24)
(9,19)-(9,63)
(9,25)-(9,27)
(9,70)-(9,71)
(9,70)-(9,75)
*)
