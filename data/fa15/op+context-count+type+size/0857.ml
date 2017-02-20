
let rec append xs ys = match xs with | [] -> ys | h::t -> h :: (append t ys);;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10)) [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n = if (n / 10) <= 0 then 0 else sumList digits n;;


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
(11,61)-(11,77)
(11,69)-(11,75)
*)

(* type error slice
(9,55)-(9,70)
(9,59)-(9,70)
(9,60)-(9,67)
(11,61)-(11,68)
(11,61)-(11,77)
*)

(* all spans
(2,15)-(2,76)
(2,18)-(2,76)
(2,23)-(2,76)
(2,29)-(2,31)
(2,45)-(2,47)
(2,58)-(2,76)
(2,58)-(2,59)
(2,63)-(2,76)
(2,64)-(2,70)
(2,71)-(2,72)
(2,73)-(2,75)
(4,20)-(5,65)
(5,2)-(5,65)
(5,5)-(5,11)
(5,5)-(5,6)
(5,10)-(5,11)
(5,17)-(5,19)
(5,25)-(5,65)
(5,25)-(5,31)
(5,32)-(5,54)
(5,33)-(5,44)
(5,45)-(5,53)
(5,46)-(5,47)
(5,50)-(5,52)
(5,55)-(5,65)
(5,56)-(5,64)
(5,56)-(5,57)
(5,62)-(5,64)
(7,11)-(7,34)
(7,15)-(7,34)
(7,15)-(7,26)
(7,27)-(7,34)
(7,28)-(7,31)
(7,32)-(7,33)
(9,16)-(9,70)
(9,21)-(9,70)
(9,27)-(9,29)
(9,43)-(9,44)
(9,55)-(9,70)
(9,55)-(9,56)
(9,59)-(9,70)
(9,60)-(9,67)
(9,68)-(9,69)
(11,28)-(11,77)
(11,32)-(11,77)
(11,35)-(11,48)
(11,35)-(11,43)
(11,36)-(11,37)
(11,40)-(11,42)
(11,47)-(11,48)
(11,54)-(11,55)
(11,61)-(11,77)
(11,61)-(11,68)
(11,69)-(11,75)
(11,76)-(11,77)
*)
