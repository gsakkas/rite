
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 1 else (additivePersistence sumList digitsOfInt n) + 1;;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 1 else (additivePersistence (sumList (digitsOfInt n))) + 1;;

*)

(* changed spans
(8,24)-(8,67)
(8,45)-(8,52)
(8,53)-(8,64)
*)

(* type error slice
(7,3)-(8,73)
(7,28)-(8,71)
(8,2)-(8,71)
(8,24)-(8,67)
(8,24)-(8,71)
(8,25)-(8,44)
*)

(* all spans
(2,20)-(3,60)
(3,2)-(3,60)
(3,5)-(3,11)
(3,5)-(3,6)
(3,10)-(3,11)
(3,17)-(3,19)
(3,25)-(3,60)
(3,48)-(3,49)
(3,25)-(3,47)
(3,26)-(3,37)
(3,38)-(3,46)
(3,39)-(3,40)
(3,43)-(3,45)
(3,50)-(3,60)
(3,51)-(3,59)
(3,51)-(3,52)
(3,57)-(3,59)
(5,16)-(5,70)
(5,21)-(5,70)
(5,27)-(5,29)
(5,43)-(5,44)
(5,55)-(5,70)
(5,55)-(5,56)
(5,59)-(5,70)
(5,60)-(5,67)
(5,68)-(5,69)
(7,28)-(8,71)
(8,2)-(8,71)
(8,5)-(8,11)
(8,5)-(8,6)
(8,9)-(8,11)
(8,17)-(8,18)
(8,24)-(8,71)
(8,24)-(8,67)
(8,25)-(8,44)
(8,45)-(8,52)
(8,53)-(8,64)
(8,65)-(8,66)
(8,70)-(8,71)
*)
