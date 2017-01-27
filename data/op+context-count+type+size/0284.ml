
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let counter = 0;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10
  then counter
  else
    (let myList = digits n in
     let num = sumList myList in
     let counter = 0 in
     counter = ((counter + (1 num)) + (additivePersistence num)));;


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
(5,15)-(5,16)
(13,8)-(13,15)
(17,6)-(18,63)
(17,20)-(17,21)
(18,6)-(18,13)
(18,6)-(18,63)
*)

(* type error slice
(3,27)-(3,38)
(3,27)-(3,46)
(3,40)-(3,46)
(5,4)-(5,18)
(5,15)-(5,16)
(7,4)-(7,37)
(7,12)-(7,34)
(7,16)-(7,27)
(7,16)-(7,34)
(7,29)-(7,32)
(7,29)-(7,34)
(7,33)-(7,34)
(9,22)-(9,70)
(9,61)-(9,68)
(9,61)-(9,70)
(9,69)-(9,70)
(12,3)-(18,63)
(12,6)-(12,7)
(12,6)-(12,12)
(12,10)-(12,12)
(13,8)-(13,15)
(15,6)-(18,63)
(15,19)-(15,25)
(15,19)-(15,27)
(15,26)-(15,27)
(16,6)-(18,63)
(16,16)-(16,23)
(16,16)-(16,30)
(16,24)-(16,30)
(17,6)-(18,63)
(18,6)-(18,63)
(18,29)-(18,30)
(18,29)-(18,34)
(18,31)-(18,34)
*)
