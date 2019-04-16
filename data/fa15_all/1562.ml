
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
(14,33)-(14,72)
aPHelper n
AppG (fromList [VarG])

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
(14,33)-(14,72)
(14,49)-(14,56)
(14,49)-(14,72)
(14,72)-(14,72)
*)
