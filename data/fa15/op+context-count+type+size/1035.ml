
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
(8,24)-(8,43)
(8,24)-(8,65)
(8,44)-(8,51)
(8,52)-(8,63)
(8,64)-(8,65)
*)

(* type error slice
(7,3)-(8,67)
(7,28)-(8,65)
(8,2)-(8,65)
(8,24)-(8,43)
(8,24)-(8,65)
*)
