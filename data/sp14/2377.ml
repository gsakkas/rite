
let rec digitsOfIntHelper n =
  if n > 0 then (digitsOfIntHelper (n / 10)) @ [n mod 10] else [];;

let rec digitsOfInt n = if n == 0 then [0] else digitsOfIntHelper n;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | x::s -> x + (sumList s);;

let rec additivePersistence n =
  if n = 0 then 0 else 1 + (additivePersistence sumList digits n);;


(* fix

let rec digitsOfIntHelper n =
  if n > 0 then (digitsOfIntHelper (n / 10)) @ [n mod 10] else [];;

let rec digitsOfInt n = if n == 0 then [0] else digitsOfIntHelper n;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | x::s -> x + (sumList s);;

let rec additivePersistence n =
  if n = 0 then 0 else 1 + (additivePersistence (sumList (digits n)));;

*)

(* changed spans
(12,28)-(12,66)
additivePersistence (sumList (digits n))
AppG [AppG [EmptyG]]

*)

(* type error slice
(11,4)-(12,68)
(11,29)-(12,66)
(12,3)-(12,66)
(12,24)-(12,66)
(12,28)-(12,66)
(12,29)-(12,48)
*)
