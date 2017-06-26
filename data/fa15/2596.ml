
let rec digitsOfInt n =
  if 0 >= n then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (n / 10) != 0
  then 1 + (additivePersistence sumList (digitsOfInt n))
  else 0;;


(* fix

let rec digitsOfInt n =
  if 0 >= n then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (n / 10) != 0
  then 1 + (additivePersistence (sumList (digitsOfInt n)))
  else 0;;

*)

(* changed spans
(9,11)-(9,56)
(9,32)-(9,39)
*)

(* type error slice
(7,3)-(10,10)
(7,28)-(10,8)
(8,2)-(10,8)
(9,11)-(9,56)
(9,12)-(9,31)
(10,7)-(10,8)
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
(7,28)-(10,8)
(8,2)-(10,8)
(8,5)-(8,18)
(8,5)-(8,13)
(8,6)-(8,7)
(8,10)-(8,12)
(8,17)-(8,18)
(9,7)-(9,56)
(9,7)-(9,8)
(9,11)-(9,56)
(9,12)-(9,31)
(9,32)-(9,39)
(9,40)-(9,55)
(9,41)-(9,52)
(9,53)-(9,54)
(10,7)-(10,8)
*)
