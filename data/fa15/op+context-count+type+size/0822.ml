
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n <= 0
  then []
  else if n < 10 then 0 else 1 + (additivePersistence sumList (digits n));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 0 else 1 + (additivePersistence (sumList (digits n)));;

*)

(* changed spans
(10,5)-(10,6)
(10,5)-(10,11)
(10,10)-(10,11)
(11,7)-(11,9)
(12,7)-(12,73)
(12,33)-(12,73)
(12,54)-(12,61)
*)

(* type error slice
(9,3)-(12,75)
(9,28)-(12,73)
(10,2)-(12,73)
(10,2)-(12,73)
(11,7)-(11,9)
(12,7)-(12,73)
(12,22)-(12,23)
(12,33)-(12,73)
(12,34)-(12,53)
*)
