
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
(14,16)-(14,55)
digitsOfInt (sumList (digitsOfInt n))
AppG [AppG [EmptyG]]

*)

(* type error slice
(3,3)-(3,58)
(3,37)-(3,52)
(3,38)-(3,49)
(3,50)-(3,51)
(8,35)-(8,71)
(8,36)-(8,47)
(8,48)-(8,70)
(8,49)-(8,60)
(8,61)-(8,69)
(10,22)-(10,71)
(10,56)-(10,71)
(10,60)-(10,71)
(10,61)-(10,68)
(10,69)-(10,70)
(14,8)-(14,15)
(14,8)-(14,55)
(14,16)-(14,55)
(14,17)-(14,24)
(14,25)-(14,54)
(14,26)-(14,37)
(14,38)-(14,53)
(14,39)-(14,50)
*)
