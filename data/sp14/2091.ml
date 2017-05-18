
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) > (List.length l2)
    then
      (let y = clone List.hd l1 ((List.length l1) - (List.length l2)) in
       (y, l2))
    else
      (let z = clone List.hd l2 ((List.length l2) - (List.length l1)) in
       (z, l1));;


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
(10,15)-(10,69)
(10,21)-(10,28)
(13,15)-(13,69)
(13,21)-(13,28)
*)

(* type error slice
(2,48)-(2,65)
(2,49)-(2,54)
(2,57)-(2,64)
(10,15)-(10,20)
(10,15)-(10,69)
(10,29)-(10,31)
(10,33)-(10,49)
(10,34)-(10,45)
(10,46)-(10,48)
(13,15)-(13,20)
(13,15)-(13,69)
(13,29)-(13,31)
(13,33)-(13,49)
(13,34)-(13,45)
(13,46)-(13,48)
*)

(* all spans
(2,14)-(2,65)
(2,16)-(2,65)
(2,20)-(2,65)
(2,23)-(2,29)
(2,23)-(2,24)
(2,28)-(2,29)
(2,35)-(2,37)
(2,43)-(2,65)
(2,43)-(2,44)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(2,57)-(2,64)
(2,58)-(2,59)
(2,62)-(2,63)
(4,12)-(14,15)
(4,15)-(14,15)
(5,2)-(14,15)
(5,5)-(5,40)
(5,5)-(5,21)
(5,6)-(5,17)
(5,18)-(5,20)
(5,24)-(5,40)
(5,25)-(5,36)
(5,37)-(5,39)
(6,7)-(6,15)
(6,8)-(6,10)
(6,12)-(6,14)
(8,4)-(14,15)
(8,7)-(8,42)
(8,7)-(8,23)
(8,8)-(8,19)
(8,20)-(8,22)
(8,26)-(8,42)
(8,27)-(8,38)
(8,39)-(8,41)
(10,6)-(11,15)
(10,15)-(10,69)
(10,15)-(10,20)
(10,21)-(10,28)
(10,29)-(10,31)
(10,32)-(10,69)
(10,33)-(10,49)
(10,34)-(10,45)
(10,46)-(10,48)
(10,52)-(10,68)
(10,53)-(10,64)
(10,65)-(10,67)
(11,7)-(11,14)
(11,8)-(11,9)
(11,11)-(11,13)
(13,6)-(14,15)
(13,15)-(13,69)
(13,15)-(13,20)
(13,21)-(13,28)
(13,29)-(13,31)
(13,32)-(13,69)
(13,33)-(13,49)
(13,34)-(13,45)
(13,46)-(13,48)
(13,52)-(13,68)
(13,53)-(13,64)
(13,65)-(13,67)
(14,7)-(14,14)
(14,8)-(14,9)
(14,11)-(14,13)
*)
