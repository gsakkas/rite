
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  if numZeros = 0
  then [(l1, l2)]
  else
    (let listZeros = clone (0, (abs numZeros)) in
     if numZeros > 0
     then [(l1, (listZeros @ l2))]
     else [((listZeros @ l1), l2)]);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  let absNumZeros = abs numZeros in
  if numZeros = 0
  then (l1, l2)
  else
    (let listZeros = clone 0 absNumZeros in
     if numZeros > 0 then (l1, (listZeros @ l2)) else ((listZeros @ l1), l2));;

*)

(* changed spans
(6,2)-(12,35)
(7,7)-(7,17)
(9,4)-(12,35)
(9,21)-(9,26)
(9,21)-(9,46)
(9,27)-(9,46)
(9,31)-(9,45)
(9,32)-(9,35)
(9,36)-(9,44)
(11,10)-(11,34)
(12,10)-(12,34)
*)

(* type error slice
(2,48)-(2,65)
(2,49)-(2,54)
(9,4)-(12,35)
(9,21)-(9,26)
(9,21)-(9,46)
(11,16)-(11,32)
(11,17)-(11,26)
(11,27)-(11,28)
(12,12)-(12,28)
(12,13)-(12,22)
(12,23)-(12,24)
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
(4,12)-(12,35)
(4,15)-(12,35)
(5,2)-(12,35)
(5,17)-(5,52)
(5,17)-(5,33)
(5,18)-(5,29)
(5,30)-(5,32)
(5,36)-(5,52)
(5,37)-(5,48)
(5,49)-(5,51)
(6,2)-(12,35)
(6,5)-(6,17)
(6,5)-(6,13)
(6,16)-(6,17)
(7,7)-(7,17)
(7,8)-(7,16)
(7,9)-(7,11)
(7,13)-(7,15)
(9,4)-(12,35)
(9,21)-(9,46)
(9,21)-(9,26)
(9,27)-(9,46)
(9,28)-(9,29)
(9,31)-(9,45)
(9,32)-(9,35)
(9,36)-(9,44)
(10,5)-(12,34)
(10,8)-(10,20)
(10,8)-(10,16)
(10,19)-(10,20)
(11,10)-(11,34)
(11,11)-(11,33)
(11,12)-(11,14)
(11,16)-(11,32)
(11,27)-(11,28)
(11,17)-(11,26)
(11,29)-(11,31)
(12,10)-(12,34)
(12,11)-(12,33)
(12,12)-(12,28)
(12,23)-(12,24)
(12,13)-(12,22)
(12,25)-(12,27)
(12,30)-(12,32)
*)
