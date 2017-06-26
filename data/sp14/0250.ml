
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else listReverse ((n mod 10) :: (listReverse (digitsOfInt (n / 10))));;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n = if (sumList (digitsOfInt n)) > 9 then 2;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else listReverse ((n mod 10) :: (listReverse (digitsOfInt (n / 10))));;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (sumList (digitsOfInt n)) > 9 then 0 else 1;;

*)

(* changed spans
(12,32)-(12,71)
(12,70)-(12,71)
*)

(* type error slice
(12,32)-(12,71)
(12,70)-(12,71)
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
(12,28)-(12,71)
(12,32)-(12,71)
(12,35)-(12,64)
(12,35)-(12,60)
(12,36)-(12,43)
(12,44)-(12,59)
(12,45)-(12,56)
(12,57)-(12,58)
(12,63)-(12,64)
(12,70)-(12,71)
*)
