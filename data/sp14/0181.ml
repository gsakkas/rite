
let rec clone x n = failwith "to be implemented";;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

*)

(* changed spans
(2,20)-(2,28)
(2,20)-(2,48)
(2,29)-(2,48)
(4,12)-(6,77)
(5,2)-(6,77)
*)

(* type error slice
(5,2)-(6,77)
(6,7)-(6,77)
*)

(* all spans
(2,14)-(2,48)
(2,16)-(2,48)
(2,20)-(2,48)
(2,20)-(2,28)
(2,29)-(2,48)
(4,12)-(6,77)
(4,15)-(6,77)
(5,2)-(6,77)
(5,5)-(5,40)
(5,5)-(5,21)
(5,6)-(5,17)
(5,18)-(5,20)
(5,24)-(5,40)
(5,25)-(5,36)
(5,37)-(5,39)
(6,7)-(6,77)
(6,8)-(6,10)
(6,12)-(6,76)
(6,13)-(6,24)
(6,25)-(6,72)
(6,26)-(6,31)
(6,32)-(6,33)
(6,34)-(6,71)
(6,35)-(6,51)
(6,36)-(6,47)
(6,48)-(6,50)
(6,54)-(6,70)
(6,55)-(6,66)
(6,67)-(6,69)
(6,73)-(6,75)
*)
