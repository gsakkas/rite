
let rec clone x n =
  if n < 1 then [] else if n = 1 then [x] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - List.length)) @ l1), l2);;


(* fix

let rec clone x n =
  if n < 1 then [] else if n = 1 then [x] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

*)

(* changed spans
(8,38)-(8,49)
(8,59)-(8,61)
*)

(* type error slice
(8,18)-(8,50)
(8,38)-(8,49)
*)

(* all spans
(2,14)-(3,69)
(2,16)-(3,69)
(3,2)-(3,69)
(3,5)-(3,10)
(3,5)-(3,6)
(3,9)-(3,10)
(3,16)-(3,18)
(3,24)-(3,69)
(3,27)-(3,32)
(3,27)-(3,28)
(3,31)-(3,32)
(3,38)-(3,41)
(3,39)-(3,40)
(3,47)-(3,69)
(3,47)-(3,48)
(3,52)-(3,69)
(3,53)-(3,58)
(3,59)-(3,60)
(3,61)-(3,68)
(3,62)-(3,63)
(3,66)-(3,67)
(5,12)-(8,62)
(5,15)-(8,62)
(6,2)-(8,62)
(6,5)-(6,40)
(6,5)-(6,21)
(6,6)-(6,17)
(6,18)-(6,20)
(6,24)-(6,40)
(6,25)-(6,36)
(6,37)-(6,39)
(7,7)-(7,67)
(7,8)-(7,10)
(7,12)-(7,66)
(7,61)-(7,62)
(7,13)-(7,60)
(7,14)-(7,19)
(7,20)-(7,21)
(7,22)-(7,59)
(7,23)-(7,39)
(7,24)-(7,35)
(7,36)-(7,38)
(7,42)-(7,58)
(7,43)-(7,54)
(7,55)-(7,57)
(7,63)-(7,65)
(8,7)-(8,62)
(8,8)-(8,57)
(8,52)-(8,53)
(8,9)-(8,51)
(8,10)-(8,15)
(8,16)-(8,17)
(8,18)-(8,50)
(8,19)-(8,35)
(8,20)-(8,31)
(8,32)-(8,34)
(8,38)-(8,49)
(8,54)-(8,56)
(8,59)-(8,61)
*)
