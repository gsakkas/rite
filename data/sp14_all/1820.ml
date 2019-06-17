
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
(13,8)-(13,15)
0
LitG

(17,6)-(18,65)
num + additivePersistence num
BopG VarG (AppG [EmptyG])

*)

(* type error slice
(5,4)-(5,18)
(5,15)-(5,16)
(11,4)-(18,68)
(11,29)-(18,66)
(12,3)-(18,66)
(13,8)-(13,15)
(15,5)-(18,66)
(16,6)-(18,65)
(17,6)-(18,65)
(18,6)-(18,65)
(18,16)-(18,65)
(18,28)-(18,35)
(18,29)-(18,30)
(18,39)-(18,64)
(18,40)-(18,59)
*)
