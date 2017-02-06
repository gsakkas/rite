
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
(12,33)-(12,72)
(12,71)-(12,72)
*)

(* type error slice
(2,4)-(3,60)
(2,21)-(3,58)
(3,3)-(3,58)
(3,3)-(3,58)
(3,3)-(3,58)
(3,3)-(3,58)
(3,3)-(3,58)
(3,3)-(3,58)
(3,3)-(3,58)
(3,9)-(3,10)
(3,24)-(3,26)
(3,38)-(3,49)
(3,38)-(3,51)
(3,38)-(3,51)
(3,38)-(3,58)
(3,38)-(3,58)
(3,38)-(3,58)
(3,50)-(3,51)
(3,53)-(3,54)
(3,55)-(3,58)
(3,55)-(3,58)
(3,56)-(3,57)
(5,21)-(8,68)
(6,3)-(8,68)
(6,6)-(6,7)
(6,6)-(6,12)
(7,8)-(7,10)
(8,8)-(8,19)
(8,36)-(8,47)
(8,36)-(8,68)
(8,36)-(8,68)
(8,49)-(8,60)
(8,49)-(8,68)
(10,17)-(10,70)
(10,22)-(10,70)
(10,22)-(10,70)
(10,22)-(10,70)
(10,22)-(10,70)
(10,28)-(10,30)
(10,56)-(10,57)
(10,61)-(10,68)
(10,61)-(10,70)
(10,61)-(10,70)
(10,69)-(10,70)
(12,4)-(12,74)
(12,29)-(12,72)
(12,33)-(12,72)
(12,33)-(12,72)
(12,33)-(12,72)
(12,58)-(12,59)
(12,71)-(12,72)
*)
