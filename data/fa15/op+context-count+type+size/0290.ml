
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
(13,8)-(13,24)
(13,16)-(13,22)
(14,8)-(14,24)
(14,16)-(14,22)
(15,29)-(15,45)
(15,37)-(15,43)
(15,44)-(15,45)
*)

(* type error slice
(10,43)-(10,63)
(10,51)-(10,58)
(10,51)-(10,63)
(13,8)-(13,15)
(13,8)-(13,24)
(14,8)-(14,15)
(14,8)-(14,24)
(15,29)-(15,36)
(15,29)-(15,45)
*)
