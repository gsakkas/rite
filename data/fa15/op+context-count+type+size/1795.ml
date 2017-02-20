
let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n < 0 then ((((clone 0) - n) :: l1), l2) else (l1, ((clone 0 n) :: l2));;


(* fix

let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n < 0 then (((clone 0 (- n)) @ l1), l2) else (l1, ((clone 0 n) @ l2));;

*)

(* changed spans
(7,17)-(7,40)
(7,18)-(7,33)
(7,19)-(7,28)
(7,20)-(7,25)
(7,31)-(7,32)
(7,56)-(7,75)
(7,58)-(7,63)
*)

(* type error slice
(3,54)-(3,71)
(3,55)-(3,60)
(7,18)-(7,33)
(7,19)-(7,28)
(7,20)-(7,25)
*)

(* all spans
(2,14)-(3,71)
(2,16)-(3,71)
(3,2)-(3,71)
(3,5)-(3,11)
(3,5)-(3,6)
(3,10)-(3,11)
(3,17)-(3,19)
(3,25)-(3,71)
(3,28)-(3,33)
(3,28)-(3,29)
(3,32)-(3,33)
(3,39)-(3,42)
(3,40)-(3,41)
(3,48)-(3,71)
(3,52)-(3,53)
(3,48)-(3,51)
(3,49)-(3,50)
(3,54)-(3,71)
(3,55)-(3,60)
(3,61)-(3,62)
(3,63)-(3,70)
(3,64)-(3,65)
(3,68)-(3,69)
(5,12)-(7,76)
(5,15)-(7,76)
(6,2)-(7,76)
(6,10)-(6,45)
(6,10)-(6,26)
(6,11)-(6,22)
(6,23)-(6,25)
(6,29)-(6,45)
(6,30)-(6,41)
(6,42)-(6,44)
(7,2)-(7,76)
(7,5)-(7,10)
(7,5)-(7,6)
(7,9)-(7,10)
(7,16)-(7,45)
(7,17)-(7,40)
(7,18)-(7,33)
(7,19)-(7,28)
(7,20)-(7,25)
(7,26)-(7,27)
(7,31)-(7,32)
(7,37)-(7,39)
(7,42)-(7,44)
(7,51)-(7,76)
(7,52)-(7,54)
(7,56)-(7,75)
(7,57)-(7,68)
(7,58)-(7,63)
(7,64)-(7,65)
(7,66)-(7,67)
(7,72)-(7,74)
*)
