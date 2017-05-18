
let rec digitsOfIntHelper n =
  if n > 0 then (digitsOfIntHelper (n / 10)) @ [n mod 10] else [];;

let rec digitsOfInt n = if n == 0 then [0] else digitsOfIntHelper n;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | x::s -> x + (sumList s);;

let rec additivePersistence n =
  if n = 0 then 0 else 1 + (additivePersistence (sumList digits n));;


(* fix

let rec digitsOfIntHelper n =
  if n > 0 then (digitsOfIntHelper (n / 10)) @ [n mod 10] else [];;

let rec digitsOfInt n = if n == 0 then [0] else digitsOfIntHelper n;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | x::s -> x + (sumList s);;

let rec additivePersistence n =
  if n = 0 then 0 else 1 + (additivePersistence (sumList (digits n)));;

*)

(* changed spans
(12,48)-(12,66)
(12,57)-(12,63)
*)

(* type error slice
(9,55)-(9,70)
(9,59)-(9,70)
(9,60)-(9,67)
(12,48)-(12,66)
(12,49)-(12,56)
*)

(* all spans
(2,26)-(3,65)
(3,2)-(3,65)
(3,5)-(3,10)
(3,5)-(3,6)
(3,9)-(3,10)
(3,16)-(3,57)
(3,45)-(3,46)
(3,16)-(3,44)
(3,17)-(3,34)
(3,35)-(3,43)
(3,36)-(3,37)
(3,40)-(3,42)
(3,47)-(3,57)
(3,48)-(3,56)
(3,48)-(3,49)
(3,54)-(3,56)
(3,63)-(3,65)
(5,20)-(5,67)
(5,24)-(5,67)
(5,27)-(5,33)
(5,27)-(5,28)
(5,32)-(5,33)
(5,39)-(5,42)
(5,40)-(5,41)
(5,48)-(5,67)
(5,48)-(5,65)
(5,66)-(5,67)
(7,11)-(7,34)
(7,15)-(7,34)
(7,15)-(7,26)
(7,27)-(7,34)
(7,28)-(7,31)
(7,32)-(7,33)
(9,16)-(9,70)
(9,21)-(9,70)
(9,27)-(9,29)
(9,43)-(9,44)
(9,55)-(9,70)
(9,55)-(9,56)
(9,59)-(9,70)
(9,60)-(9,67)
(9,68)-(9,69)
(11,28)-(12,67)
(12,2)-(12,67)
(12,5)-(12,10)
(12,5)-(12,6)
(12,9)-(12,10)
(12,16)-(12,17)
(12,23)-(12,67)
(12,23)-(12,24)
(12,27)-(12,67)
(12,28)-(12,47)
(12,48)-(12,66)
(12,49)-(12,56)
(12,57)-(12,63)
(12,64)-(12,65)
*)
