
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
(5,14)-(5,15)
(13,7)-(13,14)
(15,4)-(18,65)
(15,18)-(15,26)
(16,5)-(18,64)
(17,5)-(18,64)
(17,19)-(17,20)
(18,5)-(18,12)
(18,5)-(18,64)
*)

(* type error slice
(5,3)-(5,17)
(5,14)-(5,15)
(12,2)-(18,65)
(12,2)-(18,65)
(13,7)-(13,14)
(15,4)-(18,65)
(16,5)-(18,64)
(17,5)-(18,64)
(18,5)-(18,64)
(18,27)-(18,34)
(18,28)-(18,29)
*)
