
let rec append xs ys = match xs with | [] -> ys | h::t -> h :: (append t ys);;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10)) [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (n / 10) <= 0 then 0 else digits (sumList n);;


(* fix

let rec append xs ys = match xs with | [] -> ys | h::t -> h :: (append t ys);;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10)) [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (n / 10) <= 0 then 0 else sumList (digits n);;

*)

(* changed spans
(12,31)-(12,37)
(12,38)-(12,49)
(12,47)-(12,48)
*)

(* type error slice
(2,23)-(2,76)
(2,23)-(2,76)
(2,63)-(2,76)
(2,64)-(2,70)
(2,71)-(2,72)
(5,25)-(5,31)
(5,25)-(5,65)
(5,32)-(5,54)
(5,33)-(5,44)
(7,3)-(7,36)
(7,11)-(7,34)
(7,15)-(7,26)
(7,15)-(7,34)
(9,21)-(9,70)
(9,21)-(9,70)
(9,59)-(9,70)
(9,60)-(9,67)
(9,68)-(9,69)
(12,2)-(12,49)
(12,2)-(12,49)
(12,5)-(12,13)
(12,6)-(12,7)
(12,24)-(12,25)
(12,31)-(12,37)
(12,31)-(12,49)
(12,38)-(12,49)
(12,39)-(12,46)
(12,47)-(12,48)
*)
