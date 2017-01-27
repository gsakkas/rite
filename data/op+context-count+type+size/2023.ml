
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
(2,21)-(2,29)
(2,21)-(2,49)
(2,30)-(2,49)
(4,13)-(6,76)
(5,3)-(6,76)
(6,37)-(6,48)
(6,37)-(6,51)
(6,49)-(6,51)
(6,56)-(6,67)
(6,56)-(6,70)
(6,74)-(6,76)
*)

(* type error slice
(5,3)-(6,76)
(5,7)-(5,18)
(5,7)-(5,21)
(5,19)-(5,21)
(5,26)-(5,37)
(5,26)-(5,40)
(5,38)-(5,40)
(6,9)-(6,11)
(6,9)-(6,76)
(6,14)-(6,25)
(6,14)-(6,76)
(6,74)-(6,76)
*)
