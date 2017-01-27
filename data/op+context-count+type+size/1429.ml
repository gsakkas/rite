
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
(14,17)-(14,24)
(14,26)-(14,52)
(14,39)-(14,50)
*)

(* type error slice
(8,49)-(8,60)
(8,49)-(8,68)
(8,62)-(8,68)
(10,22)-(10,70)
(10,61)-(10,68)
(10,61)-(10,70)
(10,69)-(10,70)
(13,16)-(13,27)
(13,16)-(13,29)
(13,28)-(13,29)
(14,8)-(14,15)
(14,8)-(14,52)
(14,17)-(14,24)
(14,17)-(14,52)
(14,26)-(14,37)
(14,26)-(14,52)
(14,39)-(14,50)
(14,39)-(14,52)
(14,51)-(14,52)
*)
