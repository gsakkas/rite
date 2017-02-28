
let rec digitsOfIntHelper n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfIntHelper (n / 10));;

let rec digitsOfInt n = List.rev (digitsOfIntHelper n);;

let digits n = digitsOfInt (abs n);;

let rec sumList xs =
  match xs with | [] -> 0 | head::tail -> head + (sumList tail);;

let rec additivePersistence n =
  if ((sumList digits n) / 10) = 0
  then sumList digits n
  else additivePersistence (sumList digits n);;


(* fix

let rec digitsOfIntHelper n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfIntHelper (n / 10));;

let rec digitsOfInt n = List.rev (digitsOfIntHelper n);;

let digits n = digitsOfInt (abs n);;

let rec sumList xs =
  match xs with | [] -> 0 | head::tail -> head + (sumList tail);;

let rec additivePersistence n =
  if ((sumList (digits n)) / 10) = 0
  then sumList (digits n)
  else additivePersistence (sumList (digits n));;

*)

(* changed spans
(13,6)-(13,24)
(13,15)-(13,21)
(14,7)-(14,23)
(14,15)-(14,21)
(15,27)-(15,45)
(15,36)-(15,42)
(15,43)-(15,44)
*)

(* type error slice
(10,42)-(10,63)
(10,49)-(10,63)
(10,50)-(10,57)
(13,6)-(13,24)
(13,7)-(13,14)
(14,7)-(14,14)
(14,7)-(14,23)
(15,27)-(15,45)
(15,28)-(15,35)
*)

(* all spans
(2,26)-(3,67)
(3,2)-(3,67)
(3,5)-(3,11)
(3,5)-(3,6)
(3,10)-(3,11)
(3,17)-(3,19)
(3,25)-(3,67)
(3,25)-(3,35)
(3,26)-(3,27)
(3,32)-(3,34)
(3,39)-(3,67)
(3,40)-(3,57)
(3,58)-(3,66)
(3,59)-(3,60)
(3,63)-(3,65)
(5,20)-(5,54)
(5,24)-(5,54)
(5,24)-(5,32)
(5,33)-(5,54)
(5,34)-(5,51)
(5,52)-(5,53)
(7,11)-(7,34)
(7,15)-(7,34)
(7,15)-(7,26)
(7,27)-(7,34)
(7,28)-(7,31)
(7,32)-(7,33)
(9,16)-(10,63)
(10,2)-(10,63)
(10,8)-(10,10)
(10,24)-(10,25)
(10,42)-(10,63)
(10,42)-(10,46)
(10,49)-(10,63)
(10,50)-(10,57)
(10,58)-(10,62)
(12,28)-(15,45)
(13,2)-(15,45)
(13,5)-(13,34)
(13,5)-(13,30)
(13,6)-(13,24)
(13,7)-(13,14)
(13,15)-(13,21)
(13,22)-(13,23)
(13,27)-(13,29)
(13,33)-(13,34)
(14,7)-(14,23)
(14,7)-(14,14)
(14,15)-(14,21)
(14,22)-(14,23)
(15,7)-(15,45)
(15,7)-(15,26)
(15,27)-(15,45)
(15,28)-(15,35)
(15,36)-(15,42)
(15,43)-(15,44)
*)
