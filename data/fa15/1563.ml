
let rec sumListHelper total xs =
  match xs with | [] -> total | hd::tail -> sumListHelper (total + hd) tail;;

let rec digitsOfIntHelper n =
  if n < 1
  then []
  else if n >= 10 then (digitsOfIntHelper (n / 10)) @ [n mod 10] else [n];;

let rec digitsOfInt n = digitsOfIntHelper n;;

let rec sumList xs = sumListHelper 0 xs;;

let rec additivePersistence n = sumList digitsOfInt n;;


(* fix

let rec sumListHelper total xs =
  match xs with | [] -> total | hd::tail -> sumListHelper (total + hd) tail;;

let rec digitsOfIntHelper n =
  if n < 1
  then []
  else if n >= 10 then (digitsOfIntHelper (n / 10)) @ [n mod 10] else [n];;

let rec digitsOfInt n = digitsOfIntHelper n;;

let rec sumList xs = sumListHelper 0 xs;;

let rec additivePersistence n = sumList (digitsOfInt n);;

*)

(* changed spans
(14,32)-(14,53)
(14,40)-(14,51)
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
(14,32)-(14,39)
(14,32)-(14,53)
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
(5,26)-(8,73)
(6,2)-(8,73)
(6,5)-(6,10)
(6,5)-(6,6)
(6,9)-(6,10)
(7,7)-(7,9)
(8,7)-(8,73)
(8,10)-(8,17)
(8,10)-(8,11)
(8,15)-(8,17)
(8,23)-(8,64)
(8,52)-(8,53)
(8,23)-(8,51)
(8,24)-(8,41)
(8,42)-(8,50)
(8,43)-(8,44)
(8,47)-(8,49)
(8,54)-(8,64)
(8,55)-(8,63)
(8,55)-(8,56)
(8,61)-(8,63)
(8,70)-(8,73)
(8,71)-(8,72)
(10,20)-(10,43)
(10,24)-(10,43)
(10,24)-(10,41)
(10,42)-(10,43)
(12,16)-(12,39)
(12,21)-(12,39)
(12,21)-(12,34)
(12,35)-(12,36)
(12,37)-(12,39)
(14,28)-(14,53)
(14,32)-(14,53)
(14,32)-(14,39)
(14,40)-(14,51)
(14,52)-(14,53)
*)
