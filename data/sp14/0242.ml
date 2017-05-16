
let rec append x y = match y with | [] -> [x] | h::t -> h :: (append x t);;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let (x,y) = ((n mod 10), (n / 10)) in
     if n < 10 then [n] else append x (digitsOfInt y));;

let digits n = digitsOfInt (abs n);;

let rec numdigits x = match x with | [] -> 0 | h::t -> 1 + (numdigits x);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (sumList (digits n)) < 10
  then numdigits (digits n)
  else additivePersistence sumList n;;


(* fix

let rec append x y = match y with | [] -> [x] | h::t -> h :: (append x t);;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let (x,y) = ((n mod 10), (n / 10)) in
     if n < 10 then [n] else append x (digitsOfInt y));;

let digits n = digitsOfInt (abs n);;

let rec numdigits x = match x with | [] -> 0 | h::t -> 1 + (numdigits x);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (sumList (digits n)) < 10
  then numdigits (digits n)
  else additivePersistence (sumList (digits n));;

*)

(* changed spans
(20,7)-(20,36)
(20,27)-(20,34)
(20,35)-(20,36)
*)

(* type error slice
(17,3)-(20,38)
(17,28)-(20,36)
(18,2)-(20,36)
(20,7)-(20,26)
(20,7)-(20,36)
*)

(* all spans
(2,15)-(2,73)
(2,17)-(2,73)
(2,21)-(2,73)
(2,27)-(2,28)
(2,42)-(2,45)
(2,43)-(2,44)
(2,56)-(2,73)
(2,56)-(2,57)
(2,61)-(2,73)
(2,62)-(2,68)
(2,69)-(2,70)
(2,71)-(2,72)
(4,20)-(9,54)
(5,2)-(9,54)
(5,5)-(5,10)
(5,5)-(5,6)
(5,9)-(5,10)
(6,7)-(6,9)
(8,4)-(9,54)
(8,17)-(8,39)
(8,18)-(8,28)
(8,19)-(8,20)
(8,25)-(8,27)
(8,30)-(8,38)
(8,31)-(8,32)
(8,35)-(8,37)
(9,5)-(9,53)
(9,8)-(9,14)
(9,8)-(9,9)
(9,12)-(9,14)
(9,20)-(9,23)
(9,21)-(9,22)
(9,29)-(9,53)
(9,29)-(9,35)
(9,36)-(9,37)
(9,38)-(9,53)
(9,39)-(9,50)
(9,51)-(9,52)
(11,11)-(11,34)
(11,15)-(11,34)
(11,15)-(11,26)
(11,27)-(11,34)
(11,28)-(11,31)
(11,32)-(11,33)
(13,18)-(13,72)
(13,22)-(13,72)
(13,28)-(13,29)
(13,43)-(13,44)
(13,55)-(13,72)
(13,55)-(13,56)
(13,59)-(13,72)
(13,60)-(13,69)
(13,70)-(13,71)
(15,16)-(15,70)
(15,21)-(15,70)
(15,27)-(15,29)
(15,43)-(15,44)
(15,55)-(15,70)
(15,55)-(15,56)
(15,59)-(15,70)
(15,60)-(15,67)
(15,68)-(15,69)
(17,28)-(20,36)
(18,2)-(20,36)
(18,5)-(18,30)
(18,5)-(18,25)
(18,6)-(18,13)
(18,14)-(18,24)
(18,15)-(18,21)
(18,22)-(18,23)
(18,28)-(18,30)
(19,7)-(19,27)
(19,7)-(19,16)
(19,17)-(19,27)
(19,18)-(19,24)
(19,25)-(19,26)
(20,7)-(20,36)
(20,7)-(20,26)
(20,27)-(20,34)
(20,35)-(20,36)
*)
