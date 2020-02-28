
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 1 else additivePersistence sumList digitsOfInt n;;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 1 else (additivePersistence (sumList (digitsOfInt n))) + 1;;

*)

(* changed spans
(8,25)-(8,66)
additivePersistence (sumList (digitsOfInt n)) + 1
BopG (AppG [EmptyG]) LitG

*)

(* type error slice
(7,4)-(8,68)
(7,29)-(8,66)
(8,3)-(8,66)
(8,25)-(8,44)
(8,25)-(8,66)
*)
