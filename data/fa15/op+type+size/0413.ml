
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt ((n - (n mod 10)) / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let rec additivePersistence n =
  if n < 10 then n else additivePersistence sumList digitsOfInt n;;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt ((n - (n mod 10)) / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let rec additivePersistence n =
  if n < 10 then n else additivePersistence (sumList (digitsOfInt n));;

*)

(* changed spans
(8,24)-(8,65)
(8,44)-(8,51)
(8,52)-(8,63)
*)

(* type error slice
(7,3)-(8,67)
(7,28)-(8,65)
(8,2)-(8,65)
(8,24)-(8,43)
(8,24)-(8,65)
*)

(* all spans
(2,20)-(3,74)
(3,2)-(3,74)
(3,5)-(3,10)
(3,5)-(3,6)
(3,9)-(3,10)
(3,16)-(3,66)
(3,54)-(3,55)
(3,16)-(3,53)
(3,17)-(3,28)
(3,29)-(3,52)
(3,30)-(3,46)
(3,31)-(3,32)
(3,35)-(3,45)
(3,36)-(3,37)
(3,42)-(3,44)
(3,49)-(3,51)
(3,56)-(3,66)
(3,57)-(3,65)
(3,57)-(3,58)
(3,63)-(3,65)
(3,72)-(3,74)
(5,16)-(5,74)
(5,21)-(5,74)
(5,27)-(5,29)
(5,43)-(5,44)
(5,57)-(5,74)
(5,57)-(5,58)
(5,61)-(5,74)
(5,62)-(5,69)
(5,70)-(5,73)
(7,28)-(8,65)
(8,2)-(8,65)
(8,5)-(8,11)
(8,5)-(8,6)
(8,9)-(8,11)
(8,17)-(8,18)
(8,24)-(8,65)
(8,24)-(8,43)
(8,44)-(8,51)
(8,52)-(8,63)
(8,64)-(8,65)
*)
