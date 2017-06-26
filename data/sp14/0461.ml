
let rec reverseHelper (original,sofar) =
  match original with
  | [] -> sofar
  | hd::tl -> reverseHelper (tl, (hd :: sofar));;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l = reverseHelper (l, []);;

let palindrome w =
  let converted = explode w in
  if converted = (listReverse w) then true else false;;


(* fix

let rec reverseHelper (original,sofar) =
  match original with
  | [] -> sofar
  | hd::tl -> reverseHelper (tl, (hd :: sofar));;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l = reverseHelper (l, []);;

let palindrome w =
  let converted = explode w in
  if converted = (listReverse converted) then true else false;;

*)

(* changed spans
(16,30)-(16,31)
*)

(* type error slice
(3,2)-(5,47)
(5,14)-(5,27)
(5,14)-(5,47)
(5,28)-(5,47)
(5,29)-(5,31)
(7,3)-(10,8)
(7,12)-(10,6)
(9,12)-(9,29)
(9,13)-(9,26)
(9,27)-(9,28)
(12,3)-(12,47)
(12,20)-(12,45)
(12,24)-(12,37)
(12,24)-(12,45)
(12,38)-(12,45)
(12,39)-(12,40)
(15,18)-(15,25)
(15,18)-(15,27)
(15,26)-(15,27)
(16,17)-(16,32)
(16,18)-(16,29)
(16,30)-(16,31)
*)

(* all spans
(2,23)-(5,47)
(3,2)-(5,47)
(3,8)-(3,16)
(4,10)-(4,15)
(5,14)-(5,47)
(5,14)-(5,27)
(5,28)-(5,47)
(5,29)-(5,31)
(5,33)-(5,46)
(5,34)-(5,36)
(5,40)-(5,45)
(7,12)-(10,6)
(8,2)-(10,6)
(8,13)-(9,66)
(9,4)-(9,66)
(9,7)-(9,29)
(9,7)-(9,8)
(9,12)-(9,29)
(9,13)-(9,26)
(9,27)-(9,28)
(9,35)-(9,37)
(9,43)-(9,66)
(9,43)-(9,50)
(9,44)-(9,49)
(9,44)-(9,45)
(9,47)-(9,48)
(9,54)-(9,66)
(9,55)-(9,57)
(9,58)-(9,65)
(9,59)-(9,60)
(9,63)-(9,64)
(10,2)-(10,6)
(10,2)-(10,4)
(10,5)-(10,6)
(12,20)-(12,45)
(12,24)-(12,45)
(12,24)-(12,37)
(12,38)-(12,45)
(12,39)-(12,40)
(12,42)-(12,44)
(14,15)-(16,53)
(15,2)-(16,53)
(15,18)-(15,27)
(15,18)-(15,25)
(15,26)-(15,27)
(16,2)-(16,53)
(16,5)-(16,32)
(16,5)-(16,14)
(16,17)-(16,32)
(16,18)-(16,29)
(16,30)-(16,31)
(16,38)-(16,42)
(16,48)-(16,53)
*)
