
let rec append xs ys = match xs with | [] -> ys | h::t -> h :: (append t ys);;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10)) [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec additivePersistence n = if (n / 10) <= 0 then 0 else digits n;;


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
(9,28)-(9,69)
(9,35)-(9,43)
(9,36)-(9,37)
(9,40)-(9,42)
(9,54)-(9,55)
(9,61)-(9,67)
(9,68)-(9,69)
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
(9,32)-(9,69)
(9,32)-(9,69)
(9,54)-(9,55)
(9,61)-(9,67)
(9,61)-(9,69)
*)
