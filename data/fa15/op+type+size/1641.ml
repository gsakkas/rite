
let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n ->
      if n < 0
      then (((clone 0 abs n) @ l1), l2)
      else (((clone 0 n) @ l2), l1);;


(* fix

let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n ->
      if n < 0
      then (((clone 0 (n * (-1))) @ l1), l2)
      else (((clone 0 n) @ l2), l1);;

*)

(* changed spans
(10,13)-(10,28)
(10,22)-(10,25)
(10,31)-(10,33)
*)

(* type error slice
(3,59)-(3,76)
(3,60)-(3,65)
(3,68)-(3,75)
(10,13)-(10,28)
(10,14)-(10,19)
(10,22)-(10,25)
*)

(* all spans
(2,14)-(3,76)
(2,16)-(3,76)
(3,2)-(3,76)
(3,8)-(3,9)
(3,22)-(3,24)
(3,32)-(3,76)
(3,35)-(3,40)
(3,35)-(3,36)
(3,39)-(3,40)
(3,46)-(3,48)
(3,54)-(3,76)
(3,54)-(3,55)
(3,59)-(3,76)
(3,60)-(3,65)
(3,66)-(3,67)
(3,68)-(3,75)
(3,69)-(3,70)
(3,73)-(3,74)
(5,12)-(11,35)
(5,15)-(11,35)
(6,2)-(11,35)
(6,8)-(6,43)
(6,8)-(6,24)
(6,9)-(6,20)
(6,21)-(6,23)
(6,27)-(6,43)
(6,28)-(6,39)
(6,40)-(6,42)
(7,9)-(7,17)
(7,10)-(7,12)
(7,14)-(7,16)
(9,6)-(11,35)
(9,9)-(9,14)
(9,9)-(9,10)
(9,13)-(9,14)
(10,11)-(10,39)
(10,12)-(10,34)
(10,29)-(10,30)
(10,13)-(10,28)
(10,14)-(10,19)
(10,20)-(10,21)
(10,22)-(10,25)
(10,26)-(10,27)
(10,31)-(10,33)
(10,36)-(10,38)
(11,11)-(11,35)
(11,12)-(11,30)
(11,25)-(11,26)
(11,13)-(11,24)
(11,14)-(11,19)
(11,20)-(11,21)
(11,22)-(11,23)
(11,27)-(11,29)
(11,32)-(11,34)
*)
