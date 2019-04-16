
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
(12,32)-(12,50)
sumList (digits n)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(2,24)-(2,77)
(2,64)-(2,77)
(2,65)-(2,71)
(2,72)-(2,73)
(5,26)-(5,32)
(5,26)-(5,66)
(5,33)-(5,55)
(5,34)-(5,45)
(7,4)-(7,37)
(7,12)-(7,35)
(7,16)-(7,27)
(7,16)-(7,35)
(9,22)-(9,71)
(9,60)-(9,71)
(9,61)-(9,68)
(9,69)-(9,70)
(12,3)-(12,50)
(12,6)-(12,14)
(12,7)-(12,8)
(12,25)-(12,26)
(12,32)-(12,38)
(12,32)-(12,50)
(12,39)-(12,50)
(12,40)-(12,47)
(12,48)-(12,49)
*)
