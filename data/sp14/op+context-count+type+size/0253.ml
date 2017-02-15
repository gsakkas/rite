
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
(11,7)-(11,9)
(14,33)-(14,64)
*)

(* type error slice
(9,3)-(14,67)
(9,28)-(14,65)
(10,2)-(14,65)
(10,2)-(14,65)
(11,7)-(11,9)
(13,4)-(14,65)
(14,5)-(14,64)
(14,33)-(14,64)
(14,33)-(14,64)
(14,39)-(14,64)
(14,40)-(14,59)
*)
