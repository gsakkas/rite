
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  let rec go i =
    function
    | [] -> i
    | headElement::tailList -> go (headElement :: i) tailList in
  go [] l;;

let palindrome w = if (explode w) = (listReverse (explode w)) then true;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  let rec go i =
    function
    | [] -> i
    | headElement::tailList -> go (headElement :: i) tailList in
  go [] l;;

let palindrome w =
  if (explode w) = (listReverse (explode w)) then true else false;;

*)

(* changed spans
(14,19)-(14,71)
*)

(* type error slice
(14,19)-(14,71)
(14,67)-(14,71)
*)

(* all spans
(2,12)-(5,6)
(3,2)-(5,6)
(3,13)-(4,66)
(4,4)-(4,66)
(4,7)-(4,29)
(4,7)-(4,8)
(4,12)-(4,29)
(4,13)-(4,26)
(4,27)-(4,28)
(4,35)-(4,37)
(4,43)-(4,66)
(4,43)-(4,50)
(4,44)-(4,49)
(4,44)-(4,45)
(4,47)-(4,48)
(4,54)-(4,66)
(4,55)-(4,57)
(4,58)-(4,65)
(4,59)-(4,60)
(4,63)-(4,64)
(5,2)-(5,6)
(5,2)-(5,4)
(5,5)-(5,6)
(7,20)-(12,9)
(8,2)-(12,9)
(8,13)-(11,61)
(9,4)-(11,61)
(10,12)-(10,13)
(11,31)-(11,61)
(11,31)-(11,33)
(11,34)-(11,52)
(11,35)-(11,46)
(11,50)-(11,51)
(11,53)-(11,61)
(12,2)-(12,9)
(12,2)-(12,4)
(12,5)-(12,7)
(12,8)-(12,9)
(14,15)-(14,71)
(14,19)-(14,71)
(14,22)-(14,61)
(14,22)-(14,33)
(14,23)-(14,30)
(14,31)-(14,32)
(14,36)-(14,61)
(14,37)-(14,48)
(14,49)-(14,60)
(14,50)-(14,57)
(14,58)-(14,59)
(14,67)-(14,71)
*)
