
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  let rec recurse original reverse =
    match original with
    | [] -> reverse
    | front::back -> recurse back (front :: reverse) in
  recurse l [];;

let palindrome w = (explode w) = (listReverse explode w);;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  let rec recurse original reverse =
    match original with
    | [] -> reverse
    | front::back -> recurse back (front :: reverse) in
  recurse l [];;

let palindrome w = (explode w) = (listReverse (explode w));;

*)

(* changed spans
(14,33)-(14,56)
(14,46)-(14,53)
*)

(* type error slice
(7,3)-(12,16)
(7,20)-(12,14)
(8,2)-(12,14)
(9,4)-(11,52)
(10,12)-(10,19)
(11,21)-(11,28)
(11,21)-(11,52)
(11,34)-(11,52)
(11,44)-(11,51)
(12,2)-(12,9)
(12,2)-(12,14)
(14,33)-(14,56)
(14,34)-(14,45)
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
(7,20)-(12,14)
(8,2)-(12,14)
(8,18)-(11,52)
(8,27)-(11,52)
(9,4)-(11,52)
(9,10)-(9,18)
(10,12)-(10,19)
(11,21)-(11,52)
(11,21)-(11,28)
(11,29)-(11,33)
(11,34)-(11,52)
(11,35)-(11,40)
(11,44)-(11,51)
(12,2)-(12,14)
(12,2)-(12,9)
(12,10)-(12,11)
(12,12)-(12,14)
(14,15)-(14,56)
(14,19)-(14,56)
(14,19)-(14,30)
(14,20)-(14,27)
(14,28)-(14,29)
(14,33)-(14,56)
(14,34)-(14,45)
(14,46)-(14,53)
(14,54)-(14,55)
*)
