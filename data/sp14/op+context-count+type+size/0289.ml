
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
(15,4)-(18,47)
(16,5)-(18,46)
(17,5)-(18,46)
(18,5)-(18,12)
(18,5)-(18,46)
(18,15)-(18,46)
(18,44)-(18,45)
*)

(* type error slice
(12,2)-(18,47)
(12,2)-(18,47)
(13,7)-(13,8)
(15,4)-(18,47)
(16,5)-(18,46)
(17,5)-(18,46)
(18,5)-(18,46)
*)
