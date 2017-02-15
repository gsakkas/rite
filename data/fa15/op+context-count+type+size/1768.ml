
let rec sumListHelper total xs =
  match xs with | [] -> total | hd::tail -> sumListHelper (total + hd) tail;;

let rec digitsOfIntHelper n =
  if n < 1
  then []
  else if n >= 10 then (digitsOfIntHelper (n / 10)) @ [n mod 10] else [n];;

let rec digitsOfInt n = digitsOfIntHelper n;;

let rec sumList xs = sumListHelper 0 xs;;

let rec additivePersistence n = if n > 10 then sumList (digitsOfInt n);;


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
(14,32)-(14,70)
(14,35)-(14,36)
(14,35)-(14,41)
(14,39)-(14,41)
(14,68)-(14,69)
*)

(* type error slice
(3,2)-(3,75)
(3,2)-(3,75)
(3,24)-(3,29)
(3,44)-(3,57)
(3,44)-(3,75)
(3,58)-(3,70)
(3,59)-(3,64)
(12,3)-(12,41)
(12,16)-(12,39)
(12,21)-(12,34)
(12,21)-(12,39)
(14,32)-(14,70)
(14,32)-(14,70)
(14,32)-(14,70)
(14,47)-(14,54)
(14,47)-(14,70)
*)
