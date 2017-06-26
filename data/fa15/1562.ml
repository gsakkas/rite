
let rec sumListHelper total xs =
  match xs with | [] -> total | hd::tail -> sumListHelper (total + hd) tail;;

let rec digitsOfIntHelper n =
  if n < 1
  then []
  else (digitsOfIntHelper ((n - (n mod 10)) / 10)) @ [n mod 10];;

let rec digitsOfInt n = digitsOfIntHelper n;;

let rec sumList xs = sumListHelper 0 xs;;

let rec additivePersistence n = if n >= 10 then sumList (digitsOfInt n);;


(* fix

let rec sumListHelper total xs =
  match xs with | [] -> total | hd::tail -> sumListHelper (total + hd) tail;;

let rec digitsOfIntHelper n =
  if n < 1
  then []
  else (digitsOfIntHelper ((n - (n mod 10)) / 10)) @ [n mod 10];;

let rec digitsOfInt n = digitsOfIntHelper n;;

let rec sumList xs = sumListHelper 0 xs;;

let rec aPHelper n = if n >= 10 then sumList (digitsOfInt n) else n;;

let rec additivePersistence n = aPHelper n;;

*)

(* changed spans
(14,32)-(14,71)
*)

(* type error slice
(3,2)-(3,75)
(3,24)-(3,29)
(3,44)-(3,57)
(3,44)-(3,75)
(3,58)-(3,70)
(3,59)-(3,64)
(12,3)-(12,41)
(12,16)-(12,39)
(12,21)-(12,34)
(12,21)-(12,39)
(14,32)-(14,71)
(14,48)-(14,55)
(14,48)-(14,71)
*)

(* all spans
(2,22)-(3,75)
(2,28)-(3,75)
(3,2)-(3,75)
(3,8)-(3,10)
(3,24)-(3,29)
(3,44)-(3,75)
(3,44)-(3,57)
(3,58)-(3,70)
(3,59)-(3,64)
(3,67)-(3,69)
(3,71)-(3,75)
(5,26)-(8,63)
(6,2)-(8,63)
(6,5)-(6,10)
(6,5)-(6,6)
(6,9)-(6,10)
(7,7)-(7,9)
(8,7)-(8,63)
(8,51)-(8,52)
(8,7)-(8,50)
(8,8)-(8,25)
(8,26)-(8,49)
(8,27)-(8,43)
(8,28)-(8,29)
(8,32)-(8,42)
(8,33)-(8,34)
(8,39)-(8,41)
(8,46)-(8,48)
(8,53)-(8,63)
(8,54)-(8,62)
(8,54)-(8,55)
(8,60)-(8,62)
(10,20)-(10,43)
(10,24)-(10,43)
(10,24)-(10,41)
(10,42)-(10,43)
(12,16)-(12,39)
(12,21)-(12,39)
(12,21)-(12,34)
(12,35)-(12,36)
(12,37)-(12,39)
(14,28)-(14,71)
(14,32)-(14,71)
(14,35)-(14,42)
(14,35)-(14,36)
(14,40)-(14,42)
(14,48)-(14,71)
(14,48)-(14,55)
(14,56)-(14,71)
(14,57)-(14,68)
(14,69)-(14,70)
*)
