
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | t::h -> t + (sumList h);;

let rec additivePersAndRoot num persCount =
  let absNum = abs num in
  if absNum < 10
  then (persCount, absNum)
  else
    (let xs = digits absNum in
     let theSum = sumList xs in additivePersAndRoot theSum (persCount + 1));;

let rec additivePersistence n = let (l,r) = additivePersAndRoot n in l;;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | t::h -> t + (sumList h);;

let rec additivePersAndRoot absNum persCount =
  if absNum < 10
  then (persCount, absNum)
  else
    (let xs = digits absNum in
     let theSum = sumList xs in additivePersAndRoot theSum (persCount + 1));;

let rec additivePersistence n =
  let (l,r) = additivePersAndRoot (abs n) 0 in l;;

*)

(* changed spans
(9,28)-(15,75)
(10,2)-(15,75)
(10,15)-(10,18)
(10,15)-(10,22)
(10,19)-(10,22)
(17,44)-(17,65)
(17,64)-(17,65)
(17,69)-(17,70)
*)

(* type error slice
(15,32)-(15,51)
(15,32)-(15,74)
(17,32)-(17,70)
(17,44)-(17,63)
(17,44)-(17,65)
*)

(* all spans
(2,20)-(3,60)
(3,2)-(3,60)
(3,5)-(3,11)
(3,5)-(3,6)
(3,10)-(3,11)
(3,17)-(3,19)
(3,25)-(3,60)
(3,48)-(3,49)
(3,25)-(3,47)
(3,26)-(3,37)
(3,38)-(3,46)
(3,39)-(3,40)
(3,43)-(3,45)
(3,50)-(3,60)
(3,51)-(3,59)
(3,51)-(3,52)
(3,57)-(3,59)
(5,11)-(5,34)
(5,15)-(5,34)
(5,15)-(5,26)
(5,27)-(5,34)
(5,28)-(5,31)
(5,32)-(5,33)
(7,16)-(7,70)
(7,21)-(7,70)
(7,27)-(7,29)
(7,43)-(7,44)
(7,55)-(7,70)
(7,55)-(7,56)
(7,59)-(7,70)
(7,60)-(7,67)
(7,68)-(7,69)
(9,28)-(15,75)
(9,32)-(15,75)
(10,2)-(15,75)
(10,15)-(10,22)
(10,15)-(10,18)
(10,19)-(10,22)
(11,2)-(15,75)
(11,5)-(11,16)
(11,5)-(11,11)
(11,14)-(11,16)
(12,7)-(12,26)
(12,8)-(12,17)
(12,19)-(12,25)
(14,4)-(15,75)
(14,14)-(14,27)
(14,14)-(14,20)
(14,21)-(14,27)
(15,5)-(15,74)
(15,18)-(15,28)
(15,18)-(15,25)
(15,26)-(15,28)
(15,32)-(15,74)
(15,32)-(15,51)
(15,52)-(15,58)
(15,59)-(15,74)
(15,60)-(15,69)
(15,72)-(15,73)
(17,28)-(17,70)
(17,32)-(17,70)
(17,44)-(17,65)
(17,44)-(17,63)
(17,64)-(17,65)
(17,69)-(17,70)
*)
