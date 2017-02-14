
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else listReverse ((n mod 10) :: (listReverse (digitsOfInt (n / 10))));;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (sumList (digitsOfInt n)) > 9
  then sumList (sumList (digitsOfInt (digitsOfInt n)))
  else 1;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else listReverse ((n mod 10) :: (listReverse (digitsOfInt (n / 10))));;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (sumList (digitsOfInt n)) > 9
  then sumList (digitsOfInt (sumList (digitsOfInt n)))
  else 1;;

*)

(* changed spans
(14,16)-(14,23)
(14,24)-(14,53)
(14,38)-(14,49)
*)

(* type error slice
(3,2)-(3,57)
(3,2)-(3,57)
(3,2)-(3,57)
(3,2)-(3,57)
(3,36)-(3,51)
(3,37)-(3,48)
(3,49)-(3,50)
(8,34)-(8,70)
(8,35)-(8,46)
(8,47)-(8,69)
(8,48)-(8,59)
(8,60)-(8,68)
(10,21)-(10,70)
(10,21)-(10,70)
(10,55)-(10,70)
(10,59)-(10,70)
(10,60)-(10,67)
(10,68)-(10,69)
(14,7)-(14,14)
(14,7)-(14,54)
(14,15)-(14,54)
(14,16)-(14,23)
(14,24)-(14,53)
(14,25)-(14,36)
(14,37)-(14,52)
(14,38)-(14,49)
*)
