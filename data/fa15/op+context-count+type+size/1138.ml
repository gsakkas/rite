
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
(8,25)-(8,74)
(8,56)-(8,74)
*)

(* type error slice
(3,27)-(3,38)
(3,27)-(3,46)
(3,27)-(3,61)
(3,49)-(3,50)
(5,22)-(5,70)
(5,22)-(5,70)
(5,61)-(5,68)
(5,61)-(5,70)
(5,69)-(5,70)
(8,46)-(8,53)
(8,46)-(8,74)
(8,56)-(8,67)
(8,56)-(8,69)
(8,56)-(8,74)
(8,56)-(8,74)
*)
