
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else listReverse ((n mod 10) :: (listReverse (digitsOfInt (n / 10))));;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n > 9 then (additivePersistence sumList (digitsOfInt n)) + 1 else 0;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else listReverse ((n mod 10) :: (listReverse (digitsOfInt (n / 10))));;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n > 9 then (additivePersistence (sumList (digitsOfInt n))) + 1 else 0;;

*)

(* changed spans
(13,18)-(13,60)
(13,38)-(13,45)
*)

(* type error slice
(8,49)-(8,60)
(8,49)-(8,68)
(8,62)-(8,68)
(10,22)-(10,70)
(10,61)-(10,68)
(10,61)-(10,70)
(10,69)-(10,70)
(12,4)-(13,75)
(12,29)-(13,73)
(13,3)-(13,73)
(13,6)-(13,7)
(13,6)-(13,11)
(13,10)-(13,11)
(13,18)-(13,37)
(13,18)-(13,60)
(13,18)-(13,66)
(13,38)-(13,45)
(13,47)-(13,58)
(13,47)-(13,60)
(13,59)-(13,60)
*)
