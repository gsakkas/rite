
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
(9,9)-(9,76)
(9,24)-(9,26)
(10,9)-(10,76)
(10,24)-(10,26)
(10,69)-(10,70)
(10,72)-(10,74)
*)

(* type error slice
(2,43)-(2,44)
(2,43)-(2,65)
(2,43)-(2,65)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(5,2)-(10,76)
(5,2)-(10,76)
(6,7)-(6,15)
(6,8)-(6,10)
(8,4)-(10,76)
(9,9)-(9,76)
(9,9)-(9,76)
(9,18)-(9,23)
(9,18)-(9,64)
(9,24)-(9,26)
(9,68)-(9,75)
(9,69)-(9,70)
*)
