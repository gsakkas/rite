
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10
  then 0
  else
    (let myList = digits n in
     let num = sumList n in num + (additivePersistence num));;


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
     let num = sumList myList in num + (additivePersistence num));;

*)

(* changed spans
(14,23)-(14,24)
*)

(* type error slice
(7,21)-(7,70)
(7,59)-(7,70)
(7,60)-(7,67)
(7,68)-(7,69)
(10,5)-(10,6)
(10,5)-(10,11)
(10,9)-(10,11)
(14,15)-(14,22)
(14,15)-(14,24)
(14,23)-(14,24)
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
(9,28)-(14,60)
(10,2)-(14,60)
(10,5)-(10,11)
(10,5)-(10,6)
(10,9)-(10,11)
(11,7)-(11,8)
(13,4)-(14,60)
(13,18)-(13,26)
(13,18)-(13,24)
(13,25)-(13,26)
(14,5)-(14,59)
(14,15)-(14,24)
(14,15)-(14,22)
(14,23)-(14,24)
(14,28)-(14,59)
(14,28)-(14,31)
(14,34)-(14,59)
(14,35)-(14,54)
(14,55)-(14,58)
*)
