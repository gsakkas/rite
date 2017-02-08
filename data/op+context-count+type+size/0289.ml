
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
(5,15)-(5,16)
(15,6)-(18,46)
(16,6)-(18,46)
(17,6)-(18,46)
(18,6)-(18,13)
(18,6)-(18,46)
(18,18)-(18,46)
(18,45)-(18,46)
*)

(* type error slice
(12,3)-(18,46)
(12,3)-(18,46)
(13,8)-(13,9)
(15,6)-(18,46)
(16,6)-(18,46)
(17,6)-(18,46)
(18,6)-(18,46)
*)
