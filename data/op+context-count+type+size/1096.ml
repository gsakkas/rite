
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
(16,31)-(16,32)
*)

(* type error slice
(2,4)-(5,50)
(2,24)-(5,46)
(3,3)-(5,46)
(3,3)-(5,46)
(3,3)-(5,46)
(3,3)-(5,46)
(3,3)-(5,46)
(3,3)-(5,46)
(3,3)-(5,46)
(3,9)-(3,17)
(4,11)-(4,16)
(5,15)-(5,28)
(5,15)-(5,46)
(5,15)-(5,46)
(5,30)-(5,32)
(5,30)-(5,46)
(5,35)-(5,37)
(5,35)-(5,46)
(5,41)-(5,46)
(7,4)-(10,9)
(7,13)-(10,7)
(8,3)-(10,7)
(8,3)-(10,7)
(8,14)-(9,65)
(9,5)-(9,65)
(9,5)-(9,65)
(9,8)-(9,9)
(9,8)-(9,29)
(9,8)-(9,29)
(9,8)-(9,29)
(9,14)-(9,27)
(9,14)-(9,29)
(9,14)-(9,29)
(9,28)-(9,29)
(9,36)-(9,38)
(9,45)-(9,46)
(9,45)-(9,50)
(9,45)-(9,50)
(9,45)-(9,65)
(9,48)-(9,49)
(9,56)-(9,58)
(9,56)-(9,65)
(9,56)-(9,65)
(9,60)-(9,61)
(9,60)-(9,65)
(9,64)-(9,65)
(10,3)-(10,5)
(10,3)-(10,7)
(10,6)-(10,7)
(12,4)-(12,48)
(12,21)-(12,45)
(12,25)-(12,38)
(12,25)-(12,45)
(12,25)-(12,45)
(12,40)-(12,41)
(12,40)-(12,45)
(12,43)-(12,45)
(14,4)-(16,56)
(14,16)-(16,54)
(15,3)-(16,54)
(15,19)-(15,26)
(15,19)-(15,28)
(15,19)-(15,28)
(15,27)-(15,28)
(16,6)-(16,15)
(16,6)-(16,32)
(16,6)-(16,32)
(16,19)-(16,30)
(16,19)-(16,32)
(16,19)-(16,32)
(16,31)-(16,32)
*)
