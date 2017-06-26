
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

let rec digitalRoot n = let (l,r) = additivePersAndRoot abs n 0 in r;;


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

let rec digitalRoot n = let (l,r) = additivePersAndRoot (abs n) 0 in r;;

*)

(* changed spans
(16,36)-(16,63)
(16,56)-(16,59)
*)

(* type error slice
(10,2)-(14,75)
(11,7)-(11,26)
(13,4)-(14,75)
(14,5)-(14,74)
(14,32)-(14,51)
(14,32)-(14,74)
(16,36)-(16,55)
(16,36)-(16,63)
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
(9,28)-(14,75)
(9,35)-(14,75)
(10,2)-(14,75)
(10,5)-(10,16)
(10,5)-(10,11)
(10,14)-(10,16)
(11,7)-(11,26)
(11,8)-(11,17)
(11,19)-(11,25)
(13,4)-(14,75)
(13,14)-(13,27)
(13,14)-(13,20)
(13,21)-(13,27)
(14,5)-(14,74)
(14,18)-(14,28)
(14,18)-(14,25)
(14,26)-(14,28)
(14,32)-(14,74)
(14,32)-(14,51)
(14,52)-(14,58)
(14,59)-(14,74)
(14,60)-(14,69)
(14,72)-(14,73)
(16,20)-(16,68)
(16,24)-(16,68)
(16,36)-(16,63)
(16,36)-(16,55)
(16,56)-(16,59)
(16,60)-(16,61)
(16,62)-(16,63)
(16,67)-(16,68)
*)
