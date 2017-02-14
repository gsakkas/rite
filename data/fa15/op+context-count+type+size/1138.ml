
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 1 else additivePersistence (sumList ((digitsOfInt n) + 1));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 1 else (additivePersistence (sumList (digitsOfInt n))) + 1;;

*)

(* changed spans
(8,24)-(8,75)
(8,53)-(8,74)
*)

(* type error slice
(3,25)-(3,47)
(3,25)-(3,60)
(3,26)-(3,37)
(3,48)-(3,49)
(5,21)-(5,70)
(5,21)-(5,70)
(5,59)-(5,70)
(5,60)-(5,67)
(5,68)-(5,69)
(8,44)-(8,75)
(8,45)-(8,52)
(8,53)-(8,74)
(8,53)-(8,74)
(8,54)-(8,69)
(8,55)-(8,66)
*)
