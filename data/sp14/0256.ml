
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else listReverse ((n mod 10) :: (listReverse (digitsOfInt (n / 10))));;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  if (sumList (digitsOfInt n)) > 9
  then sumList (digitsOfInt (sumList (digitsOfInt n)));;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else listReverse ((n mod 10) :: (listReverse (digitsOfInt (n / 10))));;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  if (sumList (digitsOfInt n)) > 9
  then sumList (digitsOfInt (sumList (digitsOfInt n)))
  else 0;;

*)

(* changed spans
(13,2)-(14,54)
*)

(* type error slice
(10,55)-(10,70)
(10,59)-(10,70)
(10,60)-(10,67)
(13,2)-(14,54)
(14,7)-(14,14)
(14,7)-(14,54)
*)

(* all spans
(2,20)-(3,57)
(3,2)-(3,57)
(3,8)-(3,9)
(3,23)-(3,25)
(3,36)-(3,57)
(3,52)-(3,53)
(3,36)-(3,51)
(3,37)-(3,48)
(3,49)-(3,50)
(3,54)-(3,57)
(3,55)-(3,56)
(5,20)-(8,71)
(6,2)-(8,71)
(6,5)-(6,11)
(6,5)-(6,6)
(6,10)-(6,11)
(7,7)-(7,9)
(8,7)-(8,71)
(8,7)-(8,18)
(8,19)-(8,71)
(8,20)-(8,30)
(8,21)-(8,22)
(8,27)-(8,29)
(8,34)-(8,70)
(8,35)-(8,46)
(8,47)-(8,69)
(8,48)-(8,59)
(8,60)-(8,68)
(8,61)-(8,62)
(8,65)-(8,67)
(10,16)-(10,70)
(10,21)-(10,70)
(10,27)-(10,29)
(10,43)-(10,44)
(10,55)-(10,70)
(10,55)-(10,56)
(10,59)-(10,70)
(10,60)-(10,67)
(10,68)-(10,69)
(12,20)-(14,54)
(13,2)-(14,54)
(13,5)-(13,34)
(13,5)-(13,30)
(13,6)-(13,13)
(13,14)-(13,29)
(13,15)-(13,26)
(13,27)-(13,28)
(13,33)-(13,34)
(14,7)-(14,54)
(14,7)-(14,14)
(14,15)-(14,54)
(14,16)-(14,27)
(14,28)-(14,53)
(14,29)-(14,36)
(14,37)-(14,52)
(14,38)-(14,49)
(14,50)-(14,51)
*)
