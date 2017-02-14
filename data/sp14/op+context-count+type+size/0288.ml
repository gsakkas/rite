
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
(15,6)-(18,63)
(15,19)-(15,27)
(16,6)-(18,63)
(17,6)-(18,63)
(17,20)-(17,21)
(18,6)-(18,13)
(18,6)-(18,63)
*)

(* type error slice
(5,4)-(5,18)
(5,15)-(5,16)
(12,3)-(18,63)
(12,3)-(18,63)
(13,8)-(13,15)
(15,6)-(18,63)
(16,6)-(18,63)
(17,6)-(18,63)
(18,6)-(18,63)
(18,29)-(18,30)
(18,29)-(18,34)
*)
