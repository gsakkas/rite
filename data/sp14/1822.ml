
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let counter = 0;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10
  then 0
  else
    (let myList = digits n in
     let num = sumList myList in
     let sum = num + (additivePersistence num) in
     counter = ((additivePersistence num) + 1));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10
  then 0
  else
    (let myList = digits n in
     let num = sumList myList in
     let sum = num + (additivePersistence num) in
     1 + (additivePersistence num));;

*)

(* changed spans
(5,14)-(5,15)
(18,5)-(18,12)
(18,5)-(18,46)
(18,16)-(18,41)
(18,44)-(18,45)
*)

(* type error slice
(12,2)-(18,47)
(13,7)-(13,8)
(15,4)-(18,47)
(16,5)-(18,46)
(17,5)-(18,46)
(18,5)-(18,46)
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
(5,14)-(5,15)
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
(11,28)-(18,47)
(12,2)-(18,47)
(12,5)-(12,11)
(12,5)-(12,6)
(12,9)-(12,11)
(13,7)-(13,8)
(15,4)-(18,47)
(15,18)-(15,26)
(15,18)-(15,24)
(15,25)-(15,26)
(16,5)-(18,46)
(16,15)-(16,29)
(16,15)-(16,22)
(16,23)-(16,29)
(17,5)-(18,46)
(17,15)-(17,46)
(17,15)-(17,18)
(17,21)-(17,46)
(17,22)-(17,41)
(17,42)-(17,45)
(18,5)-(18,46)
(18,5)-(18,12)
(18,15)-(18,46)
(18,16)-(18,41)
(18,17)-(18,36)
(18,37)-(18,40)
(18,44)-(18,45)
*)
