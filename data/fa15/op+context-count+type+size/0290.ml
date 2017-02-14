
let rec digitsOfIntHelper n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfIntHelper (n / 10));;

let rec digitsOfInt n = List.rev (digitsOfIntHelper n);;

let digits n = digitsOfInt (abs n);;

let rec sumList xs =
  match xs with | [] -> 0 | head::tail -> head + (sumList tail);;

let rec additivePersistence n =
  if ((sumList digits n) / 10) = 0
  then sumList digits n
  else additivePersistence (sumList digits n);;


(* fix

let rec digitsOfIntHelper n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfIntHelper (n / 10));;

let rec digitsOfInt n = List.rev (digitsOfIntHelper n);;

let digits n = digitsOfInt (abs n);;

let rec sumList xs =
  match xs with | [] -> 0 | head::tail -> head + (sumList tail);;

let rec additivePersistence n =
  if ((sumList (digits n)) / 10) = 0
  then sumList (digits n)
  else additivePersistence (sumList (digits n));;

*)

(* changed spans
(13,6)-(13,24)
(13,15)-(13,21)
(14,7)-(14,23)
(14,15)-(14,21)
(15,27)-(15,45)
(15,36)-(15,42)
(15,43)-(15,44)
*)

(* type error slice
(10,42)-(10,63)
(10,49)-(10,63)
(10,50)-(10,57)
(13,6)-(13,24)
(13,7)-(13,14)
(14,7)-(14,14)
(14,7)-(14,23)
(15,27)-(15,45)
(15,28)-(15,35)
*)
