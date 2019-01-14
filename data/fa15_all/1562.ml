
let rec sumListHelper total xs =
  match xs with | [] -> total | hd::tail -> sumListHelper (total + hd) tail;;

let rec digitsOfIntHelper n =
  if n < 1
  then []
  else (digitsOfIntHelper ((n - (n mod 10)) / 10)) @ [n mod 10];;

let rec digitsOfInt n = digitsOfIntHelper n;;

let rec sumList xs = sumListHelper 0 xs;;

let rec additivePersistence n = if n >= 10 then sumList (digitsOfInt n);;


(* fix

let rec sumListHelper total xs =
  match xs with | [] -> total | hd::tail -> sumListHelper (total + hd) tail;;

let rec digitsOfIntHelper n =
  if n < 1
  then []
  else (digitsOfIntHelper ((n - (n mod 10)) / 10)) @ [n mod 10];;

let rec digitsOfInt n = digitsOfIntHelper n;;

let rec sumList xs = sumListHelper 0 xs;;

let rec aPHelper n = if n >= 10 then sumList (digitsOfInt n) else n;;

let rec additivePersistence n = aPHelper n;;

*)

(* changed spans
(14,32)-(14,71)
n
VarG

*)
