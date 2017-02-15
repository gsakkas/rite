
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (n / 10) <= 0
  then n mod 10
  else additivePersistence sumList digitsOfInt n;;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (n / 10) <= 0
  then n mod 10
  else additivePersistence (sumList (digitsOfInt n));;

*)

(* changed spans
(10,7)-(10,48)
(10,27)-(10,34)
(10,35)-(10,46)
*)

(* type error slice
(7,3)-(10,50)
(7,28)-(10,48)
(8,2)-(10,48)
(10,7)-(10,26)
(10,7)-(10,48)
*)
