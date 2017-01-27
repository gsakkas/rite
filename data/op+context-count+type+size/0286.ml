
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10
  then []
  else
    (let myList = digits n in
     let num = sumList myList in num + (additivePersistence num));;


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
(11,8)-(11,10)
(14,34)-(14,64)
*)

(* type error slice
(3,27)-(3,38)
(3,27)-(3,46)
(3,40)-(3,46)
(5,4)-(5,37)
(5,12)-(5,34)
(5,16)-(5,27)
(5,16)-(5,34)
(5,29)-(5,32)
(5,29)-(5,34)
(5,33)-(5,34)
(7,22)-(7,70)
(7,61)-(7,68)
(7,61)-(7,70)
(7,69)-(7,70)
(9,4)-(14,68)
(9,29)-(14,64)
(10,3)-(14,64)
(10,6)-(10,7)
(10,6)-(10,12)
(10,10)-(10,12)
(11,8)-(11,10)
(13,6)-(14,64)
(13,19)-(13,25)
(13,19)-(13,27)
(13,26)-(13,27)
(14,6)-(14,64)
(14,16)-(14,23)
(14,16)-(14,30)
(14,24)-(14,30)
(14,34)-(14,64)
(14,41)-(14,60)
(14,41)-(14,64)
(14,61)-(14,64)
*)
