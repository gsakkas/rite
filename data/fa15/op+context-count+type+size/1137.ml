
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
(8,26)-(8,67)
(8,46)-(8,53)
(8,54)-(8,65)
*)

(* type error slice
(7,4)-(8,74)
(7,29)-(8,72)
(8,3)-(8,72)
(8,18)-(8,19)
(8,26)-(8,45)
(8,26)-(8,67)
*)
