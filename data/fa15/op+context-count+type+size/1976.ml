
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
(14,33)-(14,70)
(14,36)-(14,37)
(14,36)-(14,42)
(14,40)-(14,42)
*)

(* type error slice
(3,3)-(3,76)
(3,3)-(3,76)
(3,25)-(3,30)
(3,45)-(3,58)
(3,45)-(3,76)
(3,60)-(3,65)
(3,60)-(3,70)
(12,4)-(12,42)
(12,17)-(12,40)
(12,22)-(12,35)
(12,22)-(12,40)
(14,33)-(14,70)
(14,33)-(14,70)
(14,33)-(14,70)
(14,48)-(14,55)
(14,48)-(14,70)
*)
