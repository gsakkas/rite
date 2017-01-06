
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


(* changed spans
(5,5)-(7,4)
(13,8)-(13,15)
(17,6)-(18,30)
(18,34)-(18,36)
(18,65)-(18,66)
*)

(* type error slice
(3,27)-(3,61)
*)
