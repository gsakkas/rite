
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  let sizDif = length1 - length2 in
  if sizDif > 0
  then l1 :: (clone 0 sizDif) :: l2
  else ((clone 0 (- sizDif)) :: l1) :: l2;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

*)

(* changed spans
(5,2)-(10,41)
(5,16)-(5,30)
(6,2)-(10,41)
(7,2)-(10,41)
(7,15)-(7,22)
(7,15)-(7,32)
(7,25)-(7,32)
(9,7)-(9,9)
(9,7)-(9,35)
(9,13)-(9,35)
(9,33)-(9,35)
(10,7)-(10,35)
(10,7)-(10,41)
(10,32)-(10,34)
*)

(* type error slice
(9,7)-(9,9)
(9,7)-(9,35)
(9,13)-(9,29)
(9,13)-(9,35)
(9,14)-(9,19)
(9,33)-(9,35)
(10,7)-(10,35)
(10,7)-(10,41)
(10,8)-(10,28)
(10,9)-(10,14)
(10,32)-(10,34)
(10,39)-(10,41)
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
(4,12)-(10,41)
(4,15)-(10,41)
(5,2)-(10,41)
(5,16)-(5,30)
(5,16)-(5,27)
(5,28)-(5,30)
(6,2)-(10,41)
(6,16)-(6,30)
(6,16)-(6,27)
(6,28)-(6,30)
(7,2)-(10,41)
(7,15)-(7,32)
(7,15)-(7,22)
(7,25)-(7,32)
(8,2)-(10,41)
(8,5)-(8,15)
(8,5)-(8,11)
(8,14)-(8,15)
(9,7)-(9,35)
(9,7)-(9,9)
(9,13)-(9,35)
(9,13)-(9,29)
(9,14)-(9,19)
(9,20)-(9,21)
(9,22)-(9,28)
(9,33)-(9,35)
(10,7)-(10,41)
(10,7)-(10,35)
(10,8)-(10,28)
(10,9)-(10,14)
(10,15)-(10,16)
(10,17)-(10,27)
(10,20)-(10,26)
(10,32)-(10,34)
(10,39)-(10,41)
*)
