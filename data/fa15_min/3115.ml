
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt ((n - (n mod 10)) / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let rec additivePersistence n =
  if n < 10 then n else additivePersistence sumList digitsOfInt n;;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt ((n - (n mod 10)) / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let rec additivePersistence n =
  if n < 10 then n else additivePersistence (sumList (digitsOfInt n));;

*)

(* changed spans
(8,25)-(8,66)
additivePersistence (sumList (digitsOfInt n))
AppG [AppG [EmptyG]]

*)

(* type error slice
(7,4)-(8,68)
(7,29)-(8,66)
(8,3)-(8,66)
(8,25)-(8,44)
(8,25)-(8,66)
*)
