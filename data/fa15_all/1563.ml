
let rec sumListHelper total xs =
  match xs with | [] -> total | hd::tail -> sumListHelper (total + hd) tail;;

let rec digitsOfIntHelper n =
  if n < 1
  then []
  else if n >= 10 then (digitsOfIntHelper (n / 10)) @ [n mod 10] else [n];;

let rec digitsOfInt n = digitsOfIntHelper n;;

let rec sumList xs = sumListHelper 0 xs;;

let rec additivePersistence n = sumList digitsOfInt n;;


(* fix

let rec sumListHelper total xs =
  match xs with | [] -> total | hd::tail -> sumListHelper (total + hd) tail;;

let rec digitsOfIntHelper n =
  if n < 1
  then []
  else if n >= 10 then (digitsOfIntHelper (n / 10)) @ [n mod 10] else [n];;

let rec digitsOfInt n = digitsOfIntHelper n;;

let rec sumList xs = sumListHelper 0 xs;;

let rec additivePersistence n = sumList (digitsOfInt n);;

*)

(* changed spans
(14,33)-(14,54)
sumList (digitsOfInt n)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(3,3)-(3,76)
(3,25)-(3,30)
(3,45)-(3,58)
(3,45)-(3,76)
(3,59)-(3,71)
(3,60)-(3,65)
(12,4)-(12,42)
(12,17)-(12,40)
(12,22)-(12,35)
(12,22)-(12,40)
(14,33)-(14,40)
(14,33)-(14,54)
*)
