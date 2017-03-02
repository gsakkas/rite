
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padLength l1 l2 = abs ((List.length l1) - (List.length l2));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 (padLength l1 l2)) l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, (List.append (clone 0 (padLength l1 l2)) l2))
    else l1 l2;;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padLength l1 l2 = abs ((List.length l1) - (List.length l2));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 (padLength l1 l2)) l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, (List.append (clone 0 (padLength l1 l2)) l2))
    else (l1, l2);;

*)

(* changed spans
(12,9)-(12,14)
*)

(* type error slice
(8,8)-(8,52)
(8,9)-(8,20)
(8,49)-(8,51)
(12,9)-(12,11)
(12,9)-(12,14)
*)

(* all spans
(2,14)-(2,64)
(2,16)-(2,64)
(2,20)-(2,64)
(2,23)-(2,28)
(2,23)-(2,24)
(2,27)-(2,28)
(2,34)-(2,56)
(2,34)-(2,35)
(2,39)-(2,56)
(2,40)-(2,45)
(2,46)-(2,47)
(2,48)-(2,55)
(2,49)-(2,50)
(2,53)-(2,54)
(2,62)-(2,64)
(4,14)-(4,63)
(4,17)-(4,63)
(4,22)-(4,63)
(4,22)-(4,25)
(4,26)-(4,63)
(4,27)-(4,43)
(4,28)-(4,39)
(4,40)-(4,42)
(4,46)-(4,62)
(4,47)-(4,58)
(4,59)-(4,61)
(6,12)-(12,14)
(6,15)-(12,14)
(7,2)-(12,14)
(7,5)-(7,40)
(7,5)-(7,21)
(7,6)-(7,17)
(7,18)-(7,20)
(7,24)-(7,40)
(7,25)-(7,36)
(7,37)-(7,39)
(8,7)-(8,57)
(8,8)-(8,52)
(8,9)-(8,20)
(8,21)-(8,48)
(8,22)-(8,27)
(8,28)-(8,29)
(8,30)-(8,47)
(8,31)-(8,40)
(8,41)-(8,43)
(8,44)-(8,46)
(8,49)-(8,51)
(8,54)-(8,56)
(10,4)-(12,14)
(10,7)-(10,42)
(10,7)-(10,23)
(10,8)-(10,19)
(10,20)-(10,22)
(10,26)-(10,42)
(10,27)-(10,38)
(10,39)-(10,41)
(11,9)-(11,59)
(11,10)-(11,12)
(11,14)-(11,58)
(11,15)-(11,26)
(11,27)-(11,54)
(11,28)-(11,33)
(11,34)-(11,35)
(11,36)-(11,53)
(11,37)-(11,46)
(11,47)-(11,49)
(11,50)-(11,52)
(11,55)-(11,57)
(12,9)-(12,14)
(12,9)-(12,11)
(12,12)-(12,14)
*)
