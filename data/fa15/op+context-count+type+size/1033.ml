
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 1 else (additivePersistence sumList digitsOfInt n) + 1;;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 1 else (additivePersistence (sumList (digitsOfInt n))) + 1;;

*)

(* changed spans
(8,24)-(8,67)
(8,45)-(8,52)
(8,53)-(8,64)
*)

(* type error slice
(7,3)-(8,73)
(7,28)-(8,71)
(8,2)-(8,71)
(8,17)-(8,18)
(8,24)-(8,67)
(8,25)-(8,44)
*)
